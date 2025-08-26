/**
 */
package fr.n7.PetriNet;

import org.eclipse.emf.ecore.EAttribute;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EEnum;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.EReference;

/**
 * <!-- begin-user-doc -->
 * The <b>Package</b> for the model.
 * It contains accessors for the meta objects to represent
 * <ul>
 *   <li>each class,</li>
 *   <li>each feature of each class,</li>
 *   <li>each operation of each class,</li>
 *   <li>each enum,</li>
 *   <li>and each data type</li>
 * </ul>
 * <!-- end-user-doc -->
 * @see fr.n7.PetriNet.PetriNetFactory
 * @model kind="package"
 * @generated
 */
public interface PetriNetPackage extends EPackage {
	/**
	 * The package name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNAME = "PetriNet";

	/**
	 * The package namespace URI.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNS_URI = "http://www.example.org/PetriNet";

	/**
	 * The package namespace name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNS_PREFIX = "PetriNet";

	/**
	 * The singleton instance of the package.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	PetriNetPackage eINSTANCE = fr.n7.PetriNet.impl.PetriNetPackageImpl.init();

	/**
	 * The meta object id for the '{@link fr.n7.PetriNet.impl.PetrINetImpl <em>Petr INet</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see fr.n7.PetriNet.impl.PetrINetImpl
	 * @see fr.n7.PetriNet.impl.PetriNetPackageImpl#getPetrINet()
	 * @generated
	 */
	int PETR_INET = 0;

	/**
	 * The feature id for the '<em><b>Name</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int PETR_INET__NAME = 0;

	/**
	 * The feature id for the '<em><b>Petrielement</b></em>' containment reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int PETR_INET__PETRIELEMENT = 1;

	/**
	 * The number of structural features of the '<em>Petr INet</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int PETR_INET_FEATURE_COUNT = 2;

	/**
	 * The number of operations of the '<em>Petr INet</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int PETR_INET_OPERATION_COUNT = 0;

	/**
	 * The meta object id for the '{@link fr.n7.PetriNet.impl.PetriElementImpl <em>Petri Element</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see fr.n7.PetriNet.impl.PetriElementImpl
	 * @see fr.n7.PetriNet.impl.PetriNetPackageImpl#getPetriElement()
	 * @generated
	 */
	int PETRI_ELEMENT = 1;

	/**
	 * The feature id for the '<em><b>Petrinet</b></em>' container reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int PETRI_ELEMENT__PETRINET = 0;

	/**
	 * The number of structural features of the '<em>Petri Element</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int PETRI_ELEMENT_FEATURE_COUNT = 1;

	/**
	 * The number of operations of the '<em>Petri Element</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int PETRI_ELEMENT_OPERATION_COUNT = 0;

	/**
	 * The meta object id for the '{@link fr.n7.PetriNet.impl.ArcImpl <em>Arc</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see fr.n7.PetriNet.impl.ArcImpl
	 * @see fr.n7.PetriNet.impl.PetriNetPackageImpl#getArc()
	 * @generated
	 */
	int ARC = 2;

	/**
	 * The feature id for the '<em><b>Petrinet</b></em>' container reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int ARC__PETRINET = PETRI_ELEMENT__PETRINET;

	/**
	 * The feature id for the '<em><b>Poids</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int ARC__POIDS = PETRI_ELEMENT_FEATURE_COUNT + 0;

	/**
	 * The feature id for the '<em><b>Type</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int ARC__TYPE = PETRI_ELEMENT_FEATURE_COUNT + 1;

	/**
	 * The feature id for the '<em><b>Source</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int ARC__SOURCE = PETRI_ELEMENT_FEATURE_COUNT + 2;

	/**
	 * The feature id for the '<em><b>Target</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int ARC__TARGET = PETRI_ELEMENT_FEATURE_COUNT + 3;

	/**
	 * The number of structural features of the '<em>Arc</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int ARC_FEATURE_COUNT = PETRI_ELEMENT_FEATURE_COUNT + 4;

	/**
	 * The number of operations of the '<em>Arc</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int ARC_OPERATION_COUNT = PETRI_ELEMENT_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link fr.n7.PetriNet.impl.NoeudImpl <em>Noeud</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see fr.n7.PetriNet.impl.NoeudImpl
	 * @see fr.n7.PetriNet.impl.PetriNetPackageImpl#getNoeud()
	 * @generated
	 */
	int NOEUD = 3;

	/**
	 * The feature id for the '<em><b>Petrinet</b></em>' container reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int NOEUD__PETRINET = PETRI_ELEMENT__PETRINET;

	/**
	 * The feature id for the '<em><b>Name</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int NOEUD__NAME = PETRI_ELEMENT_FEATURE_COUNT + 0;

	/**
	 * The feature id for the '<em><b>Outgoing</b></em>' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int NOEUD__OUTGOING = PETRI_ELEMENT_FEATURE_COUNT + 1;

	/**
	 * The feature id for the '<em><b>Incoming</b></em>' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int NOEUD__INCOMING = PETRI_ELEMENT_FEATURE_COUNT + 2;

	/**
	 * The number of structural features of the '<em>Noeud</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int NOEUD_FEATURE_COUNT = PETRI_ELEMENT_FEATURE_COUNT + 3;

	/**
	 * The number of operations of the '<em>Noeud</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int NOEUD_OPERATION_COUNT = PETRI_ELEMENT_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link fr.n7.PetriNet.impl.TransitionImpl <em>Transition</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see fr.n7.PetriNet.impl.TransitionImpl
	 * @see fr.n7.PetriNet.impl.PetriNetPackageImpl#getTransition()
	 * @generated
	 */
	int TRANSITION = 4;

	/**
	 * The feature id for the '<em><b>Petrinet</b></em>' container reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int TRANSITION__PETRINET = NOEUD__PETRINET;

	/**
	 * The feature id for the '<em><b>Name</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int TRANSITION__NAME = NOEUD__NAME;

	/**
	 * The feature id for the '<em><b>Outgoing</b></em>' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int TRANSITION__OUTGOING = NOEUD__OUTGOING;

	/**
	 * The feature id for the '<em><b>Incoming</b></em>' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int TRANSITION__INCOMING = NOEUD__INCOMING;

	/**
	 * The feature id for the '<em><b>Intervalle</b></em>' containment reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int TRANSITION__INTERVALLE = NOEUD_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>Transition</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int TRANSITION_FEATURE_COUNT = NOEUD_FEATURE_COUNT + 1;

	/**
	 * The number of operations of the '<em>Transition</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int TRANSITION_OPERATION_COUNT = NOEUD_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link fr.n7.PetriNet.impl.PlaceImpl <em>Place</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see fr.n7.PetriNet.impl.PlaceImpl
	 * @see fr.n7.PetriNet.impl.PetriNetPackageImpl#getPlace()
	 * @generated
	 */
	int PLACE = 5;

	/**
	 * The feature id for the '<em><b>Petrinet</b></em>' container reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int PLACE__PETRINET = NOEUD__PETRINET;

	/**
	 * The feature id for the '<em><b>Name</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int PLACE__NAME = NOEUD__NAME;

	/**
	 * The feature id for the '<em><b>Outgoing</b></em>' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int PLACE__OUTGOING = NOEUD__OUTGOING;

	/**
	 * The feature id for the '<em><b>Incoming</b></em>' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int PLACE__INCOMING = NOEUD__INCOMING;

	/**
	 * The feature id for the '<em><b>Jeton</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int PLACE__JETON = NOEUD_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>Place</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int PLACE_FEATURE_COUNT = NOEUD_FEATURE_COUNT + 1;

	/**
	 * The number of operations of the '<em>Place</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int PLACE_OPERATION_COUNT = NOEUD_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link fr.n7.PetriNet.impl.IntervalleTempsImpl <em>Intervalle Temps</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see fr.n7.PetriNet.impl.IntervalleTempsImpl
	 * @see fr.n7.PetriNet.impl.PetriNetPackageImpl#getIntervalleTemps()
	 * @generated
	 */
	int INTERVALLE_TEMPS = 6;

	/**
	 * The feature id for the '<em><b>Borne inf</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int INTERVALLE_TEMPS__BORNE_INF = 0;

	/**
	 * The feature id for the '<em><b>Borne sup</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int INTERVALLE_TEMPS__BORNE_SUP = 1;

	/**
	 * The number of structural features of the '<em>Intervalle Temps</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int INTERVALLE_TEMPS_FEATURE_COUNT = 2;

	/**
	 * The number of operations of the '<em>Intervalle Temps</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int INTERVALLE_TEMPS_OPERATION_COUNT = 0;

	/**
	 * The meta object id for the '{@link fr.n7.PetriNet.ArcType <em>Arc Type</em>}' enum.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see fr.n7.PetriNet.ArcType
	 * @see fr.n7.PetriNet.impl.PetriNetPackageImpl#getArcType()
	 * @generated
	 */
	int ARC_TYPE = 7;

	/**
	 * Returns the meta object for class '{@link fr.n7.PetriNet.PetrINet <em>Petr INet</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Petr INet</em>'.
	 * @see fr.n7.PetriNet.PetrINet
	 * @generated
	 */
	EClass getPetrINet();

	/**
	 * Returns the meta object for the attribute '{@link fr.n7.PetriNet.PetrINet#getName <em>Name</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Name</em>'.
	 * @see fr.n7.PetriNet.PetrINet#getName()
	 * @see #getPetrINet()
	 * @generated
	 */
	EAttribute getPetrINet_Name();

	/**
	 * Returns the meta object for the containment reference list '{@link fr.n7.PetriNet.PetrINet#getPetrielement <em>Petrielement</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the containment reference list '<em>Petrielement</em>'.
	 * @see fr.n7.PetriNet.PetrINet#getPetrielement()
	 * @see #getPetrINet()
	 * @generated
	 */
	EReference getPetrINet_Petrielement();

	/**
	 * Returns the meta object for class '{@link fr.n7.PetriNet.PetriElement <em>Petri Element</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Petri Element</em>'.
	 * @see fr.n7.PetriNet.PetriElement
	 * @generated
	 */
	EClass getPetriElement();

	/**
	 * Returns the meta object for the container reference '{@link fr.n7.PetriNet.PetriElement#getPetrinet <em>Petrinet</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the container reference '<em>Petrinet</em>'.
	 * @see fr.n7.PetriNet.PetriElement#getPetrinet()
	 * @see #getPetriElement()
	 * @generated
	 */
	EReference getPetriElement_Petrinet();

	/**
	 * Returns the meta object for class '{@link fr.n7.PetriNet.Arc <em>Arc</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Arc</em>'.
	 * @see fr.n7.PetriNet.Arc
	 * @generated
	 */
	EClass getArc();

	/**
	 * Returns the meta object for the attribute '{@link fr.n7.PetriNet.Arc#getPoids <em>Poids</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Poids</em>'.
	 * @see fr.n7.PetriNet.Arc#getPoids()
	 * @see #getArc()
	 * @generated
	 */
	EAttribute getArc_Poids();

	/**
	 * Returns the meta object for the attribute '{@link fr.n7.PetriNet.Arc#getType <em>Type</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Type</em>'.
	 * @see fr.n7.PetriNet.Arc#getType()
	 * @see #getArc()
	 * @generated
	 */
	EAttribute getArc_Type();

	/**
	 * Returns the meta object for the reference '{@link fr.n7.PetriNet.Arc#getSource <em>Source</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Source</em>'.
	 * @see fr.n7.PetriNet.Arc#getSource()
	 * @see #getArc()
	 * @generated
	 */
	EReference getArc_Source();

	/**
	 * Returns the meta object for the reference '{@link fr.n7.PetriNet.Arc#getTarget <em>Target</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Target</em>'.
	 * @see fr.n7.PetriNet.Arc#getTarget()
	 * @see #getArc()
	 * @generated
	 */
	EReference getArc_Target();

	/**
	 * Returns the meta object for class '{@link fr.n7.PetriNet.Noeud <em>Noeud</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Noeud</em>'.
	 * @see fr.n7.PetriNet.Noeud
	 * @generated
	 */
	EClass getNoeud();

	/**
	 * Returns the meta object for the attribute '{@link fr.n7.PetriNet.Noeud#getName <em>Name</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Name</em>'.
	 * @see fr.n7.PetriNet.Noeud#getName()
	 * @see #getNoeud()
	 * @generated
	 */
	EAttribute getNoeud_Name();

	/**
	 * Returns the meta object for the reference list '{@link fr.n7.PetriNet.Noeud#getOutgoing <em>Outgoing</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference list '<em>Outgoing</em>'.
	 * @see fr.n7.PetriNet.Noeud#getOutgoing()
	 * @see #getNoeud()
	 * @generated
	 */
	EReference getNoeud_Outgoing();

	/**
	 * Returns the meta object for the reference list '{@link fr.n7.PetriNet.Noeud#getIncoming <em>Incoming</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference list '<em>Incoming</em>'.
	 * @see fr.n7.PetriNet.Noeud#getIncoming()
	 * @see #getNoeud()
	 * @generated
	 */
	EReference getNoeud_Incoming();

	/**
	 * Returns the meta object for class '{@link fr.n7.PetriNet.Transition <em>Transition</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Transition</em>'.
	 * @see fr.n7.PetriNet.Transition
	 * @generated
	 */
	EClass getTransition();

	/**
	 * Returns the meta object for the containment reference '{@link fr.n7.PetriNet.Transition#getIntervalle <em>Intervalle</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the containment reference '<em>Intervalle</em>'.
	 * @see fr.n7.PetriNet.Transition#getIntervalle()
	 * @see #getTransition()
	 * @generated
	 */
	EReference getTransition_Intervalle();

	/**
	 * Returns the meta object for class '{@link fr.n7.PetriNet.Place <em>Place</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Place</em>'.
	 * @see fr.n7.PetriNet.Place
	 * @generated
	 */
	EClass getPlace();

	/**
	 * Returns the meta object for the attribute '{@link fr.n7.PetriNet.Place#getJeton <em>Jeton</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Jeton</em>'.
	 * @see fr.n7.PetriNet.Place#getJeton()
	 * @see #getPlace()
	 * @generated
	 */
	EAttribute getPlace_Jeton();

	/**
	 * Returns the meta object for class '{@link fr.n7.PetriNet.IntervalleTemps <em>Intervalle Temps</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Intervalle Temps</em>'.
	 * @see fr.n7.PetriNet.IntervalleTemps
	 * @generated
	 */
	EClass getIntervalleTemps();

	/**
	 * Returns the meta object for the attribute '{@link fr.n7.PetriNet.IntervalleTemps#getBorne_inf <em>Borne inf</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Borne inf</em>'.
	 * @see fr.n7.PetriNet.IntervalleTemps#getBorne_inf()
	 * @see #getIntervalleTemps()
	 * @generated
	 */
	EAttribute getIntervalleTemps_Borne_inf();

	/**
	 * Returns the meta object for the attribute '{@link fr.n7.PetriNet.IntervalleTemps#getBorne_sup <em>Borne sup</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Borne sup</em>'.
	 * @see fr.n7.PetriNet.IntervalleTemps#getBorne_sup()
	 * @see #getIntervalleTemps()
	 * @generated
	 */
	EAttribute getIntervalleTemps_Borne_sup();

	/**
	 * Returns the meta object for enum '{@link fr.n7.PetriNet.ArcType <em>Arc Type</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for enum '<em>Arc Type</em>'.
	 * @see fr.n7.PetriNet.ArcType
	 * @generated
	 */
	EEnum getArcType();

	/**
	 * Returns the factory that creates the instances of the model.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the factory that creates the instances of the model.
	 * @generated
	 */
	PetriNetFactory getPetriNetFactory();

	/**
	 * <!-- begin-user-doc -->
	 * Defines literals for the meta objects that represent
	 * <ul>
	 *   <li>each class,</li>
	 *   <li>each feature of each class,</li>
	 *   <li>each operation of each class,</li>
	 *   <li>each enum,</li>
	 *   <li>and each data type</li>
	 * </ul>
	 * <!-- end-user-doc -->
	 * @generated
	 */
	interface Literals {
		/**
		 * The meta object literal for the '{@link fr.n7.PetriNet.impl.PetrINetImpl <em>Petr INet</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see fr.n7.PetriNet.impl.PetrINetImpl
		 * @see fr.n7.PetriNet.impl.PetriNetPackageImpl#getPetrINet()
		 * @generated
		 */
		EClass PETR_INET = eINSTANCE.getPetrINet();

		/**
		 * The meta object literal for the '<em><b>Name</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute PETR_INET__NAME = eINSTANCE.getPetrINet_Name();

		/**
		 * The meta object literal for the '<em><b>Petrielement</b></em>' containment reference list feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference PETR_INET__PETRIELEMENT = eINSTANCE.getPetrINet_Petrielement();

		/**
		 * The meta object literal for the '{@link fr.n7.PetriNet.impl.PetriElementImpl <em>Petri Element</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see fr.n7.PetriNet.impl.PetriElementImpl
		 * @see fr.n7.PetriNet.impl.PetriNetPackageImpl#getPetriElement()
		 * @generated
		 */
		EClass PETRI_ELEMENT = eINSTANCE.getPetriElement();

		/**
		 * The meta object literal for the '<em><b>Petrinet</b></em>' container reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference PETRI_ELEMENT__PETRINET = eINSTANCE.getPetriElement_Petrinet();

		/**
		 * The meta object literal for the '{@link fr.n7.PetriNet.impl.ArcImpl <em>Arc</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see fr.n7.PetriNet.impl.ArcImpl
		 * @see fr.n7.PetriNet.impl.PetriNetPackageImpl#getArc()
		 * @generated
		 */
		EClass ARC = eINSTANCE.getArc();

		/**
		 * The meta object literal for the '<em><b>Poids</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute ARC__POIDS = eINSTANCE.getArc_Poids();

		/**
		 * The meta object literal for the '<em><b>Type</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute ARC__TYPE = eINSTANCE.getArc_Type();

		/**
		 * The meta object literal for the '<em><b>Source</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference ARC__SOURCE = eINSTANCE.getArc_Source();

		/**
		 * The meta object literal for the '<em><b>Target</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference ARC__TARGET = eINSTANCE.getArc_Target();

		/**
		 * The meta object literal for the '{@link fr.n7.PetriNet.impl.NoeudImpl <em>Noeud</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see fr.n7.PetriNet.impl.NoeudImpl
		 * @see fr.n7.PetriNet.impl.PetriNetPackageImpl#getNoeud()
		 * @generated
		 */
		EClass NOEUD = eINSTANCE.getNoeud();

		/**
		 * The meta object literal for the '<em><b>Name</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute NOEUD__NAME = eINSTANCE.getNoeud_Name();

		/**
		 * The meta object literal for the '<em><b>Outgoing</b></em>' reference list feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference NOEUD__OUTGOING = eINSTANCE.getNoeud_Outgoing();

		/**
		 * The meta object literal for the '<em><b>Incoming</b></em>' reference list feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference NOEUD__INCOMING = eINSTANCE.getNoeud_Incoming();

		/**
		 * The meta object literal for the '{@link fr.n7.PetriNet.impl.TransitionImpl <em>Transition</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see fr.n7.PetriNet.impl.TransitionImpl
		 * @see fr.n7.PetriNet.impl.PetriNetPackageImpl#getTransition()
		 * @generated
		 */
		EClass TRANSITION = eINSTANCE.getTransition();

		/**
		 * The meta object literal for the '<em><b>Intervalle</b></em>' containment reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference TRANSITION__INTERVALLE = eINSTANCE.getTransition_Intervalle();

		/**
		 * The meta object literal for the '{@link fr.n7.PetriNet.impl.PlaceImpl <em>Place</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see fr.n7.PetriNet.impl.PlaceImpl
		 * @see fr.n7.PetriNet.impl.PetriNetPackageImpl#getPlace()
		 * @generated
		 */
		EClass PLACE = eINSTANCE.getPlace();

		/**
		 * The meta object literal for the '<em><b>Jeton</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute PLACE__JETON = eINSTANCE.getPlace_Jeton();

		/**
		 * The meta object literal for the '{@link fr.n7.PetriNet.impl.IntervalleTempsImpl <em>Intervalle Temps</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see fr.n7.PetriNet.impl.IntervalleTempsImpl
		 * @see fr.n7.PetriNet.impl.PetriNetPackageImpl#getIntervalleTemps()
		 * @generated
		 */
		EClass INTERVALLE_TEMPS = eINSTANCE.getIntervalleTemps();

		/**
		 * The meta object literal for the '<em><b>Borne inf</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute INTERVALLE_TEMPS__BORNE_INF = eINSTANCE.getIntervalleTemps_Borne_inf();

		/**
		 * The meta object literal for the '<em><b>Borne sup</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute INTERVALLE_TEMPS__BORNE_SUP = eINSTANCE.getIntervalleTemps_Borne_sup();

		/**
		 * The meta object literal for the '{@link fr.n7.PetriNet.ArcType <em>Arc Type</em>}' enum.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see fr.n7.PetriNet.ArcType
		 * @see fr.n7.PetriNet.impl.PetriNetPackageImpl#getArcType()
		 * @generated
		 */
		EEnum ARC_TYPE = eINSTANCE.getArcType();

	}

} //PetriNetPackage
