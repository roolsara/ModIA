/**
 */
package fr.n7.PetriNet;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Petr INet</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link fr.n7.PetriNet.PetrINet#getName <em>Name</em>}</li>
 *   <li>{@link fr.n7.PetriNet.PetrINet#getPetrielement <em>Petrielement</em>}</li>
 * </ul>
 *
 * @see fr.n7.PetriNet.PetriNetPackage#getPetrINet()
 * @model
 * @generated
 */
public interface PetrINet extends EObject {
	/**
	 * Returns the value of the '<em><b>Name</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Name</em>' attribute.
	 * @see #setName(String)
	 * @see fr.n7.PetriNet.PetriNetPackage#getPetrINet_Name()
	 * @model required="true"
	 * @generated
	 */
	String getName();

	/**
	 * Sets the value of the '{@link fr.n7.PetriNet.PetrINet#getName <em>Name</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Name</em>' attribute.
	 * @see #getName()
	 * @generated
	 */
	void setName(String value);

	/**
	 * Returns the value of the '<em><b>Petrielement</b></em>' containment reference list.
	 * The list contents are of type {@link fr.n7.PetriNet.PetriElement}.
	 * It is bidirectional and its opposite is '{@link fr.n7.PetriNet.PetriElement#getPetrinet <em>Petrinet</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Petrielement</em>' containment reference list.
	 * @see fr.n7.PetriNet.PetriNetPackage#getPetrINet_Petrielement()
	 * @see fr.n7.PetriNet.PetriElement#getPetrinet
	 * @model opposite="petrinet" containment="true"
	 * @generated
	 */
	EList<PetriElement> getPetrielement();

} // PetrINet
