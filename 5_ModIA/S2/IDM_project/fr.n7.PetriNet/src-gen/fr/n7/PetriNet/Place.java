/**
 */
package fr.n7.PetriNet;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Place</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link fr.n7.PetriNet.Place#getJeton <em>Jeton</em>}</li>
 * </ul>
 *
 * @see fr.n7.PetriNet.PetriNetPackage#getPlace()
 * @model
 * @generated
 */
public interface Place extends Noeud {
	/**
	 * Returns the value of the '<em><b>Jeton</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Jeton</em>' attribute.
	 * @see #setJeton(int)
	 * @see fr.n7.PetriNet.PetriNetPackage#getPlace_Jeton()
	 * @model
	 * @generated
	 */
	int getJeton();

	/**
	 * Sets the value of the '{@link fr.n7.PetriNet.Place#getJeton <em>Jeton</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Jeton</em>' attribute.
	 * @see #getJeton()
	 * @generated
	 */
	void setJeton(int value);

} // Place
