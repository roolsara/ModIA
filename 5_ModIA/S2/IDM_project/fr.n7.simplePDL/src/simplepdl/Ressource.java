/**
 */
package simplepdl;

import org.eclipse.emf.common.util.EList;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Ressource</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link simplepdl.Ressource#getNb_ressources <em>Nb ressources</em>}</li>
 *   <li>{@link simplepdl.Ressource#getName <em>Name</em>}</li>
 *   <li>{@link simplepdl.Ressource#getUseressource <em>Useressource</em>}</li>
 * </ul>
 *
 * @see simplepdl.SimplepdlPackage#getRessource()
 * @model
 * @generated
 */
public interface Ressource extends ProcessElement {
	/**
	 * Returns the value of the '<em><b>Nb ressources</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Nb ressources</em>' attribute.
	 * @see #setNb_ressources(int)
	 * @see simplepdl.SimplepdlPackage#getRessource_Nb_ressources()
	 * @model required="true"
	 * @generated
	 */
	int getNb_ressources();

	/**
	 * Sets the value of the '{@link simplepdl.Ressource#getNb_ressources <em>Nb ressources</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Nb ressources</em>' attribute.
	 * @see #getNb_ressources()
	 * @generated
	 */
	void setNb_ressources(int value);

	/**
	 * Returns the value of the '<em><b>Name</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Name</em>' attribute.
	 * @see #setName(String)
	 * @see simplepdl.SimplepdlPackage#getRessource_Name()
	 * @model
	 * @generated
	 */
	String getName();

	/**
	 * Sets the value of the '{@link simplepdl.Ressource#getName <em>Name</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Name</em>' attribute.
	 * @see #getName()
	 * @generated
	 */
	void setName(String value);

	/**
	 * Returns the value of the '<em><b>Useressource</b></em>' reference list.
	 * The list contents are of type {@link simplepdl.UseRessource}.
	 * It is bidirectional and its opposite is '{@link simplepdl.UseRessource#getRessource <em>Ressource</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Useressource</em>' reference list.
	 * @see simplepdl.SimplepdlPackage#getRessource_Useressource()
	 * @see simplepdl.UseRessource#getRessource
	 * @model opposite="ressource"
	 * @generated
	 */
	EList<UseRessource> getUseressource();

} // Ressource
