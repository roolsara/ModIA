/**
 */
package fr.n7.PetriNet;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Petri Element</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link fr.n7.PetriNet.PetriElement#getPetrinet <em>Petrinet</em>}</li>
 * </ul>
 *
 * @see fr.n7.PetriNet.PetriNetPackage#getPetriElement()
 * @model abstract="true"
 * @generated
 */
public interface PetriElement extends EObject {

	/**
	 * Returns the value of the '<em><b>Petrinet</b></em>' container reference.
	 * It is bidirectional and its opposite is '{@link fr.n7.PetriNet.PetrINet#getPetrielement <em>Petrielement</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Petrinet</em>' container reference.
	 * @see #setPetrinet(PetrINet)
	 * @see fr.n7.PetriNet.PetriNetPackage#getPetriElement_Petrinet()
	 * @see fr.n7.PetriNet.PetrINet#getPetrielement
	 * @model opposite="petrielement" required="true" transient="false"
	 * @generated
	 */
	PetrINet getPetrinet();

	/**
	 * Sets the value of the '{@link fr.n7.PetriNet.PetriElement#getPetrinet <em>Petrinet</em>}' container reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Petrinet</em>' container reference.
	 * @see #getPetrinet()
	 * @generated
	 */
	void setPetrinet(PetrINet value);
} // PetriElement
