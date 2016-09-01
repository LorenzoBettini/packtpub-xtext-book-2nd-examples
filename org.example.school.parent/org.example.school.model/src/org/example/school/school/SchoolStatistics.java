/**
 */
package org.example.school.school;

import java.lang.Iterable;
import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Statistics</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link org.example.school.school.SchoolStatistics#getStudentsNumber <em>Students Number</em>}</li>
 *   <li>{@link org.example.school.school.SchoolStatistics#getTeachersNumber <em>Teachers Number</em>}</li>
 *   <li>{@link org.example.school.school.SchoolStatistics#getStudentsWithNoTeacher <em>Students With No Teacher</em>}</li>
 * </ul>
 *
 * @see org.example.school.school.SchoolPackage#getSchoolStatistics()
 * @model
 * @generated
 */
public interface SchoolStatistics extends EObject {
	/**
	 * Returns the value of the '<em><b>Students Number</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Students Number</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Students Number</em>' attribute.
	 * @see #setStudentsNumber(int)
	 * @see org.example.school.school.SchoolPackage#getSchoolStatistics_StudentsNumber()
	 * @model
	 * @generated
	 */
	int getStudentsNumber();

	/**
	 * Sets the value of the '{@link org.example.school.school.SchoolStatistics#getStudentsNumber <em>Students Number</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Students Number</em>' attribute.
	 * @see #getStudentsNumber()
	 * @generated
	 */
	void setStudentsNumber(int value);

	/**
	 * Returns the value of the '<em><b>Teachers Number</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Teachers Number</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Teachers Number</em>' attribute.
	 * @see #setTeachersNumber(int)
	 * @see org.example.school.school.SchoolPackage#getSchoolStatistics_TeachersNumber()
	 * @model
	 * @generated
	 */
	int getTeachersNumber();

	/**
	 * Sets the value of the '{@link org.example.school.school.SchoolStatistics#getTeachersNumber <em>Teachers Number</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Teachers Number</em>' attribute.
	 * @see #getTeachersNumber()
	 * @generated
	 */
	void setTeachersNumber(int value);

	/**
	 * Returns the value of the '<em><b>Students With No Teacher</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Students With No Teacher</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Students With No Teacher</em>' attribute.
	 * @see #setStudentsWithNoTeacher(Iterable)
	 * @see org.example.school.school.SchoolPackage#getSchoolStatistics_StudentsWithNoTeacher()
	 * @model dataType="org.example.school.school.Iterable<org.example.school.school.Student>"
	 * @generated
	 */
	Iterable<Student> getStudentsWithNoTeacher();

	/**
	 * Sets the value of the '{@link org.example.school.school.SchoolStatistics#getStudentsWithNoTeacher <em>Students With No Teacher</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Students With No Teacher</em>' attribute.
	 * @see #getStudentsWithNoTeacher()
	 * @generated
	 */
	void setStudentsWithNoTeacher(Iterable<Student> value);

} // SchoolStatistics
