/**
 */
package org.example.school.school.impl;

import java.util.Collection;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EClass;

import org.eclipse.emf.ecore.impl.ENotificationImpl;

import org.eclipse.emf.ecore.util.EObjectResolvingEList;

import org.example.school.school.SchoolPackage;
import org.example.school.school.Student;
import org.example.school.school.Teacher;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Student</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link org.example.school.school.impl.StudentImpl#getRegistrationNum <em>Registration Num</em>}</li>
 *   <li>{@link org.example.school.school.impl.StudentImpl#getTeachers <em>Teachers</em>}</li>
 * </ul>
 *
 * @generated
 */
public class StudentImpl extends PersonImpl implements Student {
	/**
	 * The default value of the '{@link #getRegistrationNum() <em>Registration Num</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getRegistrationNum()
	 * @generated
	 * @ordered
	 */
	protected static final int REGISTRATION_NUM_EDEFAULT = 0;

	/**
	 * The cached value of the '{@link #getRegistrationNum() <em>Registration Num</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getRegistrationNum()
	 * @generated
	 * @ordered
	 */
	protected int registrationNum = REGISTRATION_NUM_EDEFAULT;

	/**
	 * The cached value of the '{@link #getTeachers() <em>Teachers</em>}' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getTeachers()
	 * @generated
	 * @ordered
	 */
	protected EList<Teacher> teachers;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected StudentImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return SchoolPackage.Literals.STUDENT;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public int getRegistrationNum() {
		return registrationNum;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setRegistrationNum(int newRegistrationNum) {
		int oldRegistrationNum = registrationNum;
		registrationNum = newRegistrationNum;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, SchoolPackage.STUDENT__REGISTRATION_NUM, oldRegistrationNum, registrationNum));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EList<Teacher> getTeachers() {
		if (teachers == null) {
			teachers = new EObjectResolvingEList<Teacher>(Teacher.class, this, SchoolPackage.STUDENT__TEACHERS);
		}
		return teachers;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Object eGet(int featureID, boolean resolve, boolean coreType) {
		switch (featureID) {
			case SchoolPackage.STUDENT__REGISTRATION_NUM:
				return getRegistrationNum();
			case SchoolPackage.STUDENT__TEACHERS:
				return getTeachers();
		}
		return super.eGet(featureID, resolve, coreType);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void eSet(int featureID, Object newValue) {
		switch (featureID) {
			case SchoolPackage.STUDENT__REGISTRATION_NUM:
				setRegistrationNum((Integer)newValue);
				return;
			case SchoolPackage.STUDENT__TEACHERS:
				getTeachers().clear();
				getTeachers().addAll((Collection<? extends Teacher>)newValue);
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
			case SchoolPackage.STUDENT__REGISTRATION_NUM:
				setRegistrationNum(REGISTRATION_NUM_EDEFAULT);
				return;
			case SchoolPackage.STUDENT__TEACHERS:
				getTeachers().clear();
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
			case SchoolPackage.STUDENT__REGISTRATION_NUM:
				return registrationNum != REGISTRATION_NUM_EDEFAULT;
			case SchoolPackage.STUDENT__TEACHERS:
				return teachers != null && !teachers.isEmpty();
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
		if (eIsProxy()) return super.toString();

		StringBuffer result = new StringBuffer(super.toString());
		result.append(" (registrationNum: ");
		result.append(registrationNum);
		result.append(')');
		return result.toString();
	}

} //StudentImpl
