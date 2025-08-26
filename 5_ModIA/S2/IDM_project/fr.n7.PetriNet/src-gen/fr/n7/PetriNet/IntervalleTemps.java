/**
 */
package fr.n7.PetriNet;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Intervalle Temps</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link fr.n7.PetriNet.IntervalleTemps#getBorne_inf <em>Borne inf</em>}</li>
 *   <li>{@link fr.n7.PetriNet.IntervalleTemps#getBorne_sup <em>Borne sup</em>}</li>
 * </ul>
 *
 * @see fr.n7.PetriNet.PetriNetPackage#getIntervalleTemps()
 * @model
 * @generated
 */
public interface IntervalleTemps extends EObject {
	/**
	 * Returns the value of the '<em><b>Borne inf</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Borne inf</em>' attribute.
	 * @see #setBorne_inf(int)
	 * @see fr.n7.PetriNet.PetriNetPackage#getIntervalleTemps_Borne_inf()
	 * @model
	 * @generated
	 */
	int getBorne_inf();

	/**
	 * Sets the value of the '{@link fr.n7.PetriNet.IntervalleTemps#getBorne_inf <em>Borne inf</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Borne inf</em>' attribute.
	 * @see #getBorne_inf()
	 * @generated
	 */
	void setBorne_inf(int value);

	/**
	 * Returns the value of the '<em><b>Borne sup</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Borne sup</em>' attribute.
	 * @see #setBorne_sup(int)
	 * @see fr.n7.PetriNet.PetriNetPackage#getIntervalleTemps_Borne_sup()
	 * @model
	 * @generated
	 */
	int getBorne_sup();

	/**
	 * Sets the value of the '{@link fr.n7.PetriNet.IntervalleTemps#getBorne_sup <em>Borne sup</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Borne sup</em>' attribute.
	 * @see #getBorne_sup()
	 * @generated
	 */
	void setBorne_sup(int value);

} // IntervalleTemps
