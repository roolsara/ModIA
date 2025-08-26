/**
 */
package fr.n7.PetriNet;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Transition</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link fr.n7.PetriNet.Transition#getIntervalle <em>Intervalle</em>}</li>
 * </ul>
 *
 * @see fr.n7.PetriNet.PetriNetPackage#getTransition()
 * @model
 * @generated
 */
public interface Transition extends Noeud {
	/**
	 * Returns the value of the '<em><b>Intervalle</b></em>' containment reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Intervalle</em>' containment reference.
	 * @see #setIntervalle(IntervalleTemps)
	 * @see fr.n7.PetriNet.PetriNetPackage#getTransition_Intervalle()
	 * @model containment="true"
	 * @generated
	 */
	IntervalleTemps getIntervalle();

	/**
	 * Sets the value of the '{@link fr.n7.PetriNet.Transition#getIntervalle <em>Intervalle</em>}' containment reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Intervalle</em>' containment reference.
	 * @see #getIntervalle()
	 * @generated
	 */
	void setIntervalle(IntervalleTemps value);

} // Transition
