/**
 */
package fr.n7.PetriNet;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Arc</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link fr.n7.PetriNet.Arc#getPoids <em>Poids</em>}</li>
 *   <li>{@link fr.n7.PetriNet.Arc#getType <em>Type</em>}</li>
 *   <li>{@link fr.n7.PetriNet.Arc#getSource <em>Source</em>}</li>
 *   <li>{@link fr.n7.PetriNet.Arc#getTarget <em>Target</em>}</li>
 * </ul>
 *
 * @see fr.n7.PetriNet.PetriNetPackage#getArc()
 * @model
 * @generated
 */
public interface Arc extends PetriElement {
	/**
	 * Returns the value of the '<em><b>Poids</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Poids</em>' attribute.
	 * @see #setPoids(int)
	 * @see fr.n7.PetriNet.PetriNetPackage#getArc_Poids()
	 * @model
	 * @generated
	 */
	int getPoids();

	/**
	 * Sets the value of the '{@link fr.n7.PetriNet.Arc#getPoids <em>Poids</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Poids</em>' attribute.
	 * @see #getPoids()
	 * @generated
	 */
	void setPoids(int value);

	/**
	 * Returns the value of the '<em><b>Type</b></em>' attribute.
	 * The literals are from the enumeration {@link fr.n7.PetriNet.ArcType}.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Type</em>' attribute.
	 * @see fr.n7.PetriNet.ArcType
	 * @see #setType(ArcType)
	 * @see fr.n7.PetriNet.PetriNetPackage#getArc_Type()
	 * @model
	 * @generated
	 */
	ArcType getType();

	/**
	 * Sets the value of the '{@link fr.n7.PetriNet.Arc#getType <em>Type</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Type</em>' attribute.
	 * @see fr.n7.PetriNet.ArcType
	 * @see #getType()
	 * @generated
	 */
	void setType(ArcType value);

	/**
	 * Returns the value of the '<em><b>Source</b></em>' reference.
	 * It is bidirectional and its opposite is '{@link fr.n7.PetriNet.Noeud#getOutgoing <em>Outgoing</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Source</em>' reference.
	 * @see #setSource(Noeud)
	 * @see fr.n7.PetriNet.PetriNetPackage#getArc_Source()
	 * @see fr.n7.PetriNet.Noeud#getOutgoing
	 * @model opposite="outgoing" required="true"
	 * @generated
	 */
	Noeud getSource();

	/**
	 * Sets the value of the '{@link fr.n7.PetriNet.Arc#getSource <em>Source</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Source</em>' reference.
	 * @see #getSource()
	 * @generated
	 */
	void setSource(Noeud value);

	/**
	 * Returns the value of the '<em><b>Target</b></em>' reference.
	 * It is bidirectional and its opposite is '{@link fr.n7.PetriNet.Noeud#getIncoming <em>Incoming</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Target</em>' reference.
	 * @see #setTarget(Noeud)
	 * @see fr.n7.PetriNet.PetriNetPackage#getArc_Target()
	 * @see fr.n7.PetriNet.Noeud#getIncoming
	 * @model opposite="incoming" required="true"
	 * @generated
	 */
	Noeud getTarget();

	/**
	 * Sets the value of the '{@link fr.n7.PetriNet.Arc#getTarget <em>Target</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Target</em>' reference.
	 * @see #getTarget()
	 * @generated
	 */
	void setTarget(Noeud value);

} // Arc
