/**
 */
package fr.n7.PetriNet.impl;

import fr.n7.PetriNet.IntervalleTemps;
import fr.n7.PetriNet.PetriNetPackage;
import fr.n7.PetriNet.Transition;
import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.common.notify.NotificationChain;
import org.eclipse.emf.ecore.EClass;

import org.eclipse.emf.ecore.InternalEObject;
import org.eclipse.emf.ecore.impl.ENotificationImpl;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Transition</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link fr.n7.PetriNet.impl.TransitionImpl#getIntervalle <em>Intervalle</em>}</li>
 * </ul>
 *
 * @generated
 */
public class TransitionImpl extends NoeudImpl implements Transition {
	/**
	 * The cached value of the '{@link #getIntervalle() <em>Intervalle</em>}' containment reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getIntervalle()
	 * @generated
	 * @ordered
	 */
	protected IntervalleTemps intervalle;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected TransitionImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return PetriNetPackage.Literals.TRANSITION;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public IntervalleTemps getIntervalle() {
		return intervalle;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public NotificationChain basicSetIntervalle(IntervalleTemps newIntervalle, NotificationChain msgs) {
		IntervalleTemps oldIntervalle = intervalle;
		intervalle = newIntervalle;
		if (eNotificationRequired()) {
			ENotificationImpl notification = new ENotificationImpl(this, Notification.SET,
					PetriNetPackage.TRANSITION__INTERVALLE, oldIntervalle, newIntervalle);
			if (msgs == null)
				msgs = notification;
			else
				msgs.add(notification);
		}
		return msgs;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setIntervalle(IntervalleTemps newIntervalle) {
		if (newIntervalle != intervalle) {
			NotificationChain msgs = null;
			if (intervalle != null)
				msgs = ((InternalEObject) intervalle).eInverseRemove(this,
						EOPPOSITE_FEATURE_BASE - PetriNetPackage.TRANSITION__INTERVALLE, null, msgs);
			if (newIntervalle != null)
				msgs = ((InternalEObject) newIntervalle).eInverseAdd(this,
						EOPPOSITE_FEATURE_BASE - PetriNetPackage.TRANSITION__INTERVALLE, null, msgs);
			msgs = basicSetIntervalle(newIntervalle, msgs);
			if (msgs != null)
				msgs.dispatch();
		} else if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, PetriNetPackage.TRANSITION__INTERVALLE, newIntervalle,
					newIntervalle));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public NotificationChain eInverseRemove(InternalEObject otherEnd, int featureID, NotificationChain msgs) {
		switch (featureID) {
		case PetriNetPackage.TRANSITION__INTERVALLE:
			return basicSetIntervalle(null, msgs);
		}
		return super.eInverseRemove(otherEnd, featureID, msgs);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Object eGet(int featureID, boolean resolve, boolean coreType) {
		switch (featureID) {
		case PetriNetPackage.TRANSITION__INTERVALLE:
			return getIntervalle();
		}
		return super.eGet(featureID, resolve, coreType);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public void eSet(int featureID, Object newValue) {
		switch (featureID) {
		case PetriNetPackage.TRANSITION__INTERVALLE:
			setIntervalle((IntervalleTemps) newValue);
			return;
		}
		super.eSet(featureID, newValue);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public void eUnset(int featureID) {
		switch (featureID) {
		case PetriNetPackage.TRANSITION__INTERVALLE:
			setIntervalle((IntervalleTemps) null);
			return;
		}
		super.eUnset(featureID);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public boolean eIsSet(int featureID) {
		switch (featureID) {
		case PetriNetPackage.TRANSITION__INTERVALLE:
			return intervalle != null;
		}
		return super.eIsSet(featureID);
	}

} //TransitionImpl
