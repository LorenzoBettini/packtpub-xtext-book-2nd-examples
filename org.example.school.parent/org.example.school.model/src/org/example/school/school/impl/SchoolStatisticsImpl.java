/**
 */
package org.example.school.school.impl;

import java.lang.Iterable;
import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.ecore.EClass;

import org.eclipse.emf.ecore.impl.ENotificationImpl;
import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;

import org.example.school.school.SchoolPackage;
import org.example.school.school.SchoolStatistics;
import org.example.school.school.Student;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Statistics</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link org.example.school.school.impl.SchoolStatisticsImpl#getStudentsNumber <em>Students Number</em>}</li>
 *   <li>{@link org.example.school.school.impl.SchoolStatisticsImpl#getTeachersNumber <em>Teachers Number</em>}</li>
 *   <li>{@link org.example.school.school.impl.SchoolStatisticsImpl#getStudentsWithNoTeacher <em>Students With No Teacher</em>}</li>
 * </ul>
 *
 * @generated
 */
public class SchoolStatisticsImpl extends MinimalEObjectImpl.Container implements SchoolStatistics {
	/**
	 * The default value of the '{@link #getStudentsNumber() <em>Students Number</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getStudentsNumber()
	 * @generated
	 * @ordered
	 */
	protected static final int STUDENTS_NUMBER_EDEFAULT = 0;

	/**
	 * The cached value of the '{@link #getStudentsNumber() <em>Students Number</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getStudentsNumber()
	 * @generated
	 * @ordered
	 */
	protected int studentsNumber = STUDENTS_NUMBER_EDEFAULT;

	/**
	 * The default value of the '{@link #getTeachersNumber() <em>Teachers Number</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getTeachersNumber()
	 * @generated
	 * @ordered
	 */
	protected static final int TEACHERS_NUMBER_EDEFAULT = 0;

	/**
	 * The cached value of the '{@link #getTeachersNumber() <em>Teachers Number</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getTeachersNumber()
	 * @generated
	 * @ordered
	 */
	protected int teachersNumber = TEACHERS_NUMBER_EDEFAULT;

	/**
	 * The cached value of the '{@link #getStudentsWithNoTeacher() <em>Students With No Teacher</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getStudentsWithNoTeacher()
	 * @generated
	 * @ordered
	 */
	protected Iterable<Student> studentsWithNoTeacher;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected SchoolStatisticsImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return SchoolPackage.Literals.SCHOOL_STATISTICS;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public int getStudentsNumber() {
		return studentsNumber;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setStudentsNumber(int newStudentsNumber) {
		int oldStudentsNumber = studentsNumber;
		studentsNumber = newStudentsNumber;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, SchoolPackage.SCHOOL_STATISTICS__STUDENTS_NUMBER, oldStudentsNumber, studentsNumber));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public int getTeachersNumber() {
		return teachersNumber;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setTeachersNumber(int newTeachersNumber) {
		int oldTeachersNumber = teachersNumber;
		teachersNumber = newTeachersNumber;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, SchoolPackage.SCHOOL_STATISTICS__TEACHERS_NUMBER, oldTeachersNumber, teachersNumber));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Iterable<Student> getStudentsWithNoTeacher() {
		return studentsWithNoTeacher;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setStudentsWithNoTeacher(Iterable<Student> newStudentsWithNoTeacher) {
		Iterable<Student> oldStudentsWithNoTeacher = studentsWithNoTeacher;
		studentsWithNoTeacher = newStudentsWithNoTeacher;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, SchoolPackage.SCHOOL_STATISTICS__STUDENTS_WITH_NO_TEACHER, oldStudentsWithNoTeacher, studentsWithNoTeacher));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Object eGet(int featureID, boolean resolve, boolean coreType) {
		switch (featureID) {
			case SchoolPackage.SCHOOL_STATISTICS__STUDENTS_NUMBER:
				return getStudentsNumber();
			case SchoolPackage.SCHOOL_STATISTICS__TEACHERS_NUMBER:
				return getTeachersNumber();
			case SchoolPackage.SCHOOL_STATISTICS__STUDENTS_WITH_NO_TEACHER:
				return getStudentsWithNoTeacher();
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
			case SchoolPackage.SCHOOL_STATISTICS__STUDENTS_NUMBER:
				setStudentsNumber((Integer)newValue);
				return;
			case SchoolPackage.SCHOOL_STATISTICS__TEACHERS_NUMBER:
				setTeachersNumber((Integer)newValue);
				return;
			case SchoolPackage.SCHOOL_STATISTICS__STUDENTS_WITH_NO_TEACHER:
				setStudentsWithNoTeacher((Iterable<Student>)newValue);
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
			case SchoolPackage.SCHOOL_STATISTICS__STUDENTS_NUMBER:
				setStudentsNumber(STUDENTS_NUMBER_EDEFAULT);
				return;
			case SchoolPackage.SCHOOL_STATISTICS__TEACHERS_NUMBER:
				setTeachersNumber(TEACHERS_NUMBER_EDEFAULT);
				return;
			case SchoolPackage.SCHOOL_STATISTICS__STUDENTS_WITH_NO_TEACHER:
				setStudentsWithNoTeacher((Iterable<Student>)null);
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
			case SchoolPackage.SCHOOL_STATISTICS__STUDENTS_NUMBER:
				return studentsNumber != STUDENTS_NUMBER_EDEFAULT;
			case SchoolPackage.SCHOOL_STATISTICS__TEACHERS_NUMBER:
				return teachersNumber != TEACHERS_NUMBER_EDEFAULT;
			case SchoolPackage.SCHOOL_STATISTICS__STUDENTS_WITH_NO_TEACHER:
				return studentsWithNoTeacher != null;
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
		result.append(" (studentsNumber: ");
		result.append(studentsNumber);
		result.append(", teachersNumber: ");
		result.append(teachersNumber);
		result.append(", studentsWithNoTeacher: ");
		result.append(studentsWithNoTeacher);
		result.append(')');
		return result.toString();
	}

} //SchoolStatisticsImpl
