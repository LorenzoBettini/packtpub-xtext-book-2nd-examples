/**
 */
package org.example.school.school;

import java.lang.Iterable;
import org.eclipse.emf.common.util.EList;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>School</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link org.example.school.school.School#getStatistics <em>Statistics</em>}</li>
 *   <li>{@link org.example.school.school.School#getPersons <em>Persons</em>}</li>
 * </ul>
 *
 * @see org.example.school.school.SchoolPackage#getSchool()
 * @model
 * @generated
 */
public interface School extends Named {
	/**
	 * Returns the value of the '<em><b>Persons</b></em>' containment reference list.
	 * The list contents are of type {@link org.example.school.school.Person}.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Persons</em>' containment reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Persons</em>' containment reference list.
	 * @see org.example.school.school.SchoolPackage#getSchool_Persons()
	 * @model containment="true"
	 * @generated
	 */
	EList<Person> getPersons();

	/**
	 * Returns the value of the '<em><b>Statistics</b></em>' containment reference.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Statistics</em>' containment reference isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Statistics</em>' containment reference.
	 * @see #setStatistics(SchoolStatistics)
	 * @see org.example.school.school.SchoolPackage#getSchool_Statistics()
	 * @model containment="true" transient="true"
	 * @generated
	 */
	SchoolStatistics getStatistics();

	/**
	 * Sets the value of the '{@link org.example.school.school.School#getStatistics <em>Statistics</em>}' containment reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Statistics</em>' containment reference.
	 * @see #getStatistics()
	 * @generated
	 */
	void setStatistics(SchoolStatistics value);

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @model kind="operation" dataType="org.example.school.school.Iterable&lt;org.example.school.school.Student&gt;"
	 * @generated
	 */
	Iterable<Student> getStudents();

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @model kind="operation" dataType="org.example.school.school.Iterable&lt;org.example.school.school.Teacher&gt;"
	 * @generated
	 */
	Iterable<Teacher> getTeachers();

} // School
