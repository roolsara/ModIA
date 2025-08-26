/**
 */
package simplepdl;

import org.eclipse.emf.common.util.EList;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Ressources</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link simplepdl.Ressources#getNb_ressources <em>Nb ressources</em>}</li>
 *   <li>{@link simplepdl.Ressources#getName <em>Name</em>}</li>
 *   <li>{@link simplepdl.Ressources#getUseressource <em>Useressource</em>}</li>
 * </ul>
 *
 * @see simplepdl.SimplepdlPackage#getRessources()
 * @model
 * @generated
 */
public interface Ressources extends ProcessElement {
	/**
	 * Returns the value of the '<em><b>Nb ressources</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Nb ressources</em>' attribute.
	 * @see #setNb_ressources(int)
	 * @see simplepdl.SimplepdlPackage#getRessources_Nb_ressources()
	 * @model
	 * @generated
	 */
	int getNb_ressources();

	/**
	 * Sets the value of the '{@link simplepdl.Ressources#getNb_ressources <em>Nb ressources</em>}' attribute.
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
	 * @see simplepdl.SimplepdlPackage#getRessources_Name()
	 * @model
	 * @generated
	 */
	String getName();

	/**
	 * Sets the value of the '{@link simplepdl.Ressources#getName <em>Name</em>}' attribute.
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
	 * @see simplepdl.SimplepdlPackage#getRessources_Useressource()
	 * @see simplepdl.UseRessource#getRessource
	 * @model opposite="ressource"
	 * @generated
	 */
	EList<UseRessource> getUseressource();

} // Ressources
