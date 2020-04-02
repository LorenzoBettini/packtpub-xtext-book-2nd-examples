package org.example.smalljava.ui;

import static org.example.testutils.EclipseTestUtils.TEST_PROJECT;

import org.eclipse.xtext.ui.wizard.IExtendedProjectInfo;
import org.eclipse.xtext.ui.wizard.template.TemplateNewProjectWizard;

/**
 * Manually set the project name (usually set in the dialog text edit)
 * 
 * @author Lorenzo Bettini
 */
public class SmallJavaTestableNewProjectWizard extends TemplateNewProjectWizard {

	@Override
	public IExtendedProjectInfo getProjectInfo() {
		IExtendedProjectInfo projectInfo = super.getProjectInfo();
		projectInfo.setProjectName(TEST_PROJECT);
		return projectInfo;
	}

}
