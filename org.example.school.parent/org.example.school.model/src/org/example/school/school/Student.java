/**
 */
package org.example.school.school;

import org.eclipse.emf.common.util.EList;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Student</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link org.example.school.school.Student#getRegistrationNum <em>Registration Num</em>}</li>
 *   <li>{@link org.example.school.school.Student#getTeachers <em>Teachers</em>}</li>
 * </ul>
 *
 * @see org.example.school.school.SchoolPackage#getStudent()
 * @model
 * @generated
 */
public interface Student extends Person {
	/**
	 * Returns the value of the '<em><b>Registration Num</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Registration Num</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Registration Num</em>' attribute.
	 * @see #setRegistrationNum(int)
	 * @see org.example.school.school.SchoolPackage#getStudent_RegistrationNum()
	 * @model
	 * @generated
	 */
	int getRegistrationNum();

	/**
	 * Sets the value of the '{@link org.example.school.school.Student#getRegistrationNum <em>Registration Num</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Registration Num</em>' attribute.
	 * @see #getRegistrationNum()
	 * @generated
	 */
	void setRegistrationNum(int value);

	/**
	 * Returns the value of the '<em><b>Teachers</b></em>' reference list.
	 * The list contents are of type {@link org.example.school.school.Teacher}.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Teachers</em>' reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Teachers</em>' reference list.
	 * @see org.example.school.school.SchoolPackage#getStudent_Teachers()
	 * @model
	 * @generated
	 */
	EList<Teacher> getTeachers();

} // Student
