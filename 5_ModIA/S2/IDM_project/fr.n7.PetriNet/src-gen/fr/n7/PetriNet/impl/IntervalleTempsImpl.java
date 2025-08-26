/**
 */
package fr.n7.PetriNet.impl;

import fr.n7.PetriNet.IntervalleTemps;
import fr.n7.PetriNet.PetriNetPackage;
import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.impl.ENotificationImpl;
import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Intervalle Temps</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link fr.n7.PetriNet.impl.IntervalleTempsImpl#getBorne_inf <em>Borne inf</em>}</li>
 *   <li>{@link fr.n7.PetriNet.impl.IntervalleTempsImpl#getBorne_sup <em>Borne sup</em>}</li>
 * </ul>
 *
 * @generated
 */
public class IntervalleTempsImpl extends MinimalEObjectImpl.Container implements IntervalleTemps {
	/**
	 * The default value of the '{@link #getBorne_inf() <em>Borne inf</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getBorne_inf()
	 * @generated
	 * @ordered
	 */
	protected static final int BORNE_INF_EDEFAULT = 0;

	/**
	 * The cached value of the '{@link #getBorne_inf() <em>Borne inf</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getBorne_inf()
	 * @generated
	 * @ordered
	 */
	protected int borne_inf = BORNE_INF_EDEFAULT;

	/**
	 * The default value of the '{@link #getBorne_sup() <em>Borne sup</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getBorne_sup()
	 * @generated
	 * @ordered
	 */
	protected static final int BORNE_SUP_EDEFAULT = 0;

	/**
	 * The cached value of the '{@link #getBorne_sup() <em>Borne sup</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getBorne_sup()
	 * @generated
	 * @ordered
	 */
	protected int borne_sup = BORNE_SUP_EDEFAULT;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected IntervalleTempsImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return PetriNetPackage.Literals.INTERVALLE_TEMPS;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public int getBorne_inf() {
		return borne_inf;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setBorne_inf(int newBorne_inf) {
		int oldBorne_inf = borne_inf;
		borne_inf = newBorne_inf;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, PetriNetPackage.INTERVALLE_TEMPS__BORNE_INF,
					oldBorne_inf, borne_inf));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public int getBorne_sup() {
		return borne_sup;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setBorne_sup(int newBorne_sup) {
		int oldBorne_sup = borne_sup;
		borne_sup = newBorne_sup;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, PetriNetPackage.INTERVALLE_TEMPS__BORNE_SUP,
					oldBorne_sup, borne_sup));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Object eGet(int featureID, boolean resolve, boolean coreType) {
		switch (featureID) {
		case PetriNetPackage.INTERVALLE_TEMPS__BORNE_INF:
			return getBorne_inf();
		case PetriNetPackage.INTERVALLE_TEMPS__BORNE_SUP:
			return getBorne_sup();
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
		case PetriNetPackage.INTERVALLE_TEMPS__BORNE_INF:
			setBorne_inf((Integer) newValue);
			return;
		case PetriNetPackage.INTERVALLE_TEMPS__BORNE_SUP:
			setBorne_sup((Integer) newValue);
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
		case PetriNetPackage.INTERVALLE_TEMPS__BORNE_INF:
			setBorne_inf(BORNE_INF_EDEFAULT);
			return;
		case PetriNetPackage.INTERVALLE_TEMPS__BORNE_SUP:
			setBorne_sup(BORNE_SUP_EDEFAULT);
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
		case PetriNetPackage.INTERVALLE_TEMPS__BORNE_INF:
			return borne_inf != BORNE_INF_EDEFAULT;
		case PetriNetPackage.INTERVALLE_TEMPS__BORNE_SUP:
			return borne_sup != BORNE_SUP_EDEFAULT;
		}
		return super.eIsSet(featureID);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public String toString() {
		if (eIsProxy())
			return super.toString();

		StringBuilder result = new StringBuilder(super.toString());
		result.append(" (borne_inf: ");
		result.append(borne_inf);
		result.append(", borne_sup: ");
		result.append(borne_sup);
		result.append(')');
		return result.toString();
	}

} //IntervalleTempsImpl
