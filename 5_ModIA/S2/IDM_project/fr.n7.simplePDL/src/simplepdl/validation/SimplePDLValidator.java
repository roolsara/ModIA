package simplepdl.validation;

import java.util.stream.Collectors;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.resource.Resource;

import simplepdl.Guidance;
import simplepdl.ProcessElement;
import simplepdl.SimplepdlPackage;
import simplepdl.UseRessource;
import simplepdl.WorkDefinition;
import simplepdl.WorkSequence;
import simplepdl.util.SimplepdlSwitch;
import simplepdl.Ressource;

/**
 * Réalise la validation d'un EObject issu de SimplePDL (en théorie, d'un process).
 * Cet classe visite le modèle et utilise les caseXXX pour rediriger l'algo vers la
 * bonne méthode.
 * Attention, lorsqu'une classe est un parent il faut aller faire la visite des enfants
 * manuellement (cf. caseProcess typiquement).
 * 
 * La classe Switch exige un paramètre de généricité (et gère une partie de la visite à
 * base de comparaison à null). Ici le paramètre est un booléen mais en réalité on ne
 * s'en sert pas...
 * 
 * @author Guillaume Dupont
 * @version 0.1
 */
public class SimplePDLValidator extends SimplepdlSwitch<Boolean> {
	/**
	 * Expression régulière qui correspond à un identifiant bien formé.
	 */
	private static final String IDENT_REGEX = "^[A-Za-z_][A-Za-z0-9_]*$";
	
	/**
	 * Résultat de la validation (état interne réinitialisé à chaque nouvelle validation).
	 */
	private ValidationResult result = null;
	
	/**
	 * Construire un validateur
	 */
	public SimplePDLValidator() {}
	
	/**
	 * Lancer la validation et compiler les résultats dans un ValidationResult.
	 * Cette méthode se charge de créer un résultat de validation vide puis de
	 *  visiter les process présents dans la ressource.
	 * @param resource resource à valider
	 * @return résultat de validation
	 */
	public ValidationResult validate(Resource resource) {
		this.result = new ValidationResult();
		
		for (EObject object : resource.getContents()) {
			this.doSwitch(object);
		}
		
		return this.result;
	}


	/**
	 * Méthode appelée lorsque l'objet visité est un Process.
	 * Cet méthode amorce aussi la visite des éléments enfants.
	 * @param object élément visité
	 * @return résultat de validation (null ici, ce qui permet de poursuivre la visite
	 * vers les classes parentes, le cas échéant)
	 */
	@Override
	public Boolean caseProcess(simplepdl.Process object) {
		// Contraintes sur process
		this.result.recordIfFailed(
				object.getName() != null && object.getName().matches(IDENT_REGEX), 
				object, 
				"Le nom du process ne respecte pas les conventions Java");
		
		// Visite
		for (ProcessElement pe : object.getProcessElements()) {
			this.doSwitch(pe);
		}
		
		
		return null;
	}

	/**
	 * Méthode appelée lorsque l'objet visité est un ProcessElement (ou un sous type).
	 * @param object élément visité
	 * @return résultat de validation (null ici, ce qui permet de poursuivre la visite
	 * vers les classes parentes, le cas échéant)
	 */
	@Override
	public Boolean caseProcessElement(ProcessElement object) {
		return null;
	}

	/**
	 * Méthode appelée lorsque l'objet visité est une WorkDefinition.
	 * @param object élément visité
	 * @return résultat de validation (null ici, ce qui permet de poursuivre la visite
	 * vers les classes parentes, le cas échéant)
	 */
	@Override
	public Boolean caseWorkDefinition(WorkDefinition object) {
		// Contraintes sur WD
		this.result.recordIfFailed(
				object.getName() != null && object.getName().matches(IDENT_REGEX), 
				object, 
				"Le nom de l'activité ne respecte pas les conventions Java");
		
		this.result.recordIfFailed(
				object.getProcess().getProcessElements().stream()
					.filter(p -> p.eClass().getClassifierID() == SimplepdlPackage.WORK_DEFINITION)
					
					.allMatch(pe -> (pe.equals(object) || !((WorkDefinition) pe).getName().equals(object.getName()))),
					object, 
				"Le nom de l'activité (" + object.getName() + ") n'est pas unique");
		
		// Valider chaque UseRessource associé
	    for (UseRessource ur : object.getUseressource()) {
	        this.doSwitch(ur);
	    }
		return null;
	}

	/**
	 * Méthode appelée lorsque l'objet visité est une WorkSequence.
	 * @param object élément visité
	 * @return résultat de validation (null ici, ce qui permet de poursuivre la visite
	 * vers les classes parentes, le cas échéant)
	 */
	@Override
	public Boolean caseWorkSequence(WorkSequence object) {
		// Contraintes sur WS
		this.result.recordIfFailed(
				!object.getPredecessor().equals(object.getSuccessor()), 
				object,
				"La dépendance relie l'activité " + object.getPredecessor().getName() + " à elle-même");
		
		this.result.recordIfFailed(
			    object.getProcess().getProcessElements().stream()
			        .filter(pe -> pe instanceof WorkSequence)
			        .map(pe -> (WorkSequence) pe)
			        .filter(ws -> ws != object)
			        .noneMatch(ws ->
			            ws.getPredecessor().equals(object.getPredecessor()) &&
			            ws.getSuccessor().equals(object.getSuccessor()) &&
			            ws.getLinkType() == object.getLinkType()
			        ),
			    object,
			    "Une dépendance identique existe déjà entre " + object.getPredecessor().getName()
			    + " et " + object.getSuccessor().getName()
			);
		
	
		
		return null;
	}

	/**
	 * Méthode appelée lorsque l'objet visité est une Guidance.
	 * @param object élément visité
	 * @return résultat de validation (null ici, ce qui permet de poursuivre la visite
	 * vers les classes parentes, le cas échéant)
	 */
	@Override
	public Boolean caseGuidance(Guidance object) {
		// Contrainte sur Guidance
		this.result.recordIfFailed(
			!object.getText().isBlank(), object, "Une Guidance doit avoir un texte non vide");
		
		return null;
	}

	/**
	 * Cas par défaut, lorsque l'objet visité ne correspond pas à un des autres cas.
	 * Cette méthode est aussi appelée lorsqu'une méthode renvoie null (comme une sorte de
	 * fallback).
	 * On pourrait implémenter le switch différemment, en ne renvoyant null dans les autres
	 * méthodes que si la contrainte ne sert à rien, et se servir de cette méthode pour
	 * identifier les éléments étrangers (qui de toute façon ne doivent pas exister).
	 * C'est aussi la méthode appelée si on ne redéfini pas un des caseXXX.
	 * @param object objet visité
	 * @return résultat, null ici
	 */
	@Override
	public Boolean defaultCase(EObject object) {
		return null;
	}
	
	@Override
	public Boolean caseRessource(Ressource object) {
	    object.getUseressource().stream()
	        .collect(Collectors.groupingBy(UseRessource::getWorkdefinition,
	                 Collectors.summingInt(UseRessource::getQuantity)))
	        .forEach((wd, totalQuantity) -> {
	            this.result.recordIfFailed(
	                totalQuantity <= object.getNb_ressources(),
	                object,
	                "L'activité \"" + wd.getName() + "\" demande " + totalQuantity +
	                " unités de la ressource \"" + object.getName() +
	                "\", ce qui dépasse la quantité disponible (" + object.getNb_ressources() + ")."
	            );
	        });
		
		
	    this.result.recordIfFailed(
	    		object.getNb_ressources() >= 1,
	            object,
	        "Les ressources ne sont pas suffisantes. Il faut au minimum une ressource."
	    );
	    
	    this.result.recordIfFailed(
	    		object.getName() != null && object.getName().matches(IDENT_REGEX),
	    		object,
	    		"Le nom de la ressource ne respecte pas les conventions Java."
	    	);
	    return null;
	}
	
	@Override
	public Boolean caseUseRessource(simplepdl.UseRessource object) {
		
		this.result.recordIfFailed(
		        object.getQuantity()>= 0,
		        object,
		        "La quantité de ressource utilisée doit être positive."
		    );
		
	
		
		return null;
	}
	
	
}
