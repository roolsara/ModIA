/**
 */
package fr.n7.PetriNet;

import org.eclipse.emf.common.util.EList;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Noeud</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link fr.n7.PetriNet.Noeud#getName <em>Name</em>}</li>
 *   <li>{@link fr.n7.PetriNet.Noeud#getOutgoing <em>Outgoing</em>}</li>
 *   <li>{@link fr.n7.PetriNet.Noeud#getIncoming <em>Incoming</em>}</li>
 * </ul>
 *
 * @see fr.n7.PetriNet.PetriNetPackage#getNoeud()
 * @model abstract="true"
 * @generated
 */
public interface Noeud extends PetriElement {
	/**
	 * Returns the value of the '<em><b>Name</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Name</em>' attribute.
	 * @see #setName(String)
	 * @see fr.n7.PetriNet.PetriNetPackage#getNoeud_Name()
	 * @model required="true"
	 * @generated
	 */
	String getName();

	/**
	 * Sets the value of the '{@link fr.n7.PetriNet.Noeud#getName <em>Name</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Name</em>' attribute.
	 * @see #getName()
	 * @generated
	 */
	void setName(String value);

	/**
	 * Returns the value of the '<em><b>Outgoing</b></em>' reference list.
	 * The list contents are of type {@link fr.n7.PetriNet.Arc}.
	 * It is bidirectional and its opposite is '{@link fr.n7.PetriNet.Arc#getSource <em>Source</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Outgoing</em>' reference list.
	 * @see fr.n7.PetriNet.PetriNetPackage#getNoeud_Outgoing()
	 * @see fr.n7.PetriNet.Arc#getSource
	 * @model opposite="source"
	 * @generated
	 */
	EList<Arc> getOutgoing();

	/**
	 * Returns the value of the '<em><b>Incoming</b></em>' reference list.
	 * The list contents are of type {@link fr.n7.PetriNet.Arc}.
	 * It is bidirectional and its opposite is '{@link fr.n7.PetriNet.Arc#getTarget <em>Target</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Incoming</em>' reference list.
	 * @see fr.n7.PetriNet.PetriNetPackage#getNoeud_Incoming()
	 * @see fr.n7.PetriNet.Arc#getTarget
	 * @model opposite="target"
	 * @generated
	 */
	EList<Arc> getIncoming();

} // Noeud
