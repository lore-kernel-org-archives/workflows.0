Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3816B40DFB7;
	Sat,  2 May 2026 02:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777690213; cv=none; b=T2YPGCQHdSmE3JLFva1HZqoXnKPYHbxXtNdwZlpKqaLpN5FA2k+jFcTZckgMvpnePDszslCFfd5e1QT1U3W3iHXWd55s4yIfGg5yM7iLGq9s5JZHG4FosQz5OxgtYWGha0GCIarn+hCH2zx/AlY5h0gZoqnm3csp9hOcp6Pyn80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777690213; c=relaxed/simple;
	bh=0fwQmSlkaP5NWFmcWTOC7QiSqCIYeES1elEE5OxzCQA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kCAe6DfkYWBiOXIzEjauz9sG+QZ0PH0o52OPf/97ZqAreyUDEHFxkAUh6VqI8UEo78ySkc4vjnouHu+7xiaarkCP++QpK6FiMShYWeUVFPV3WkPcG7QxTAupn+R1jdvCLNckkgsfKJWVzvWVxQ5qT/L3y9E44J5pQWIo6K5Npro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=g6NimZUP; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=guuXZotP; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="g6NimZUP";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="guuXZotP"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1777690203;
	bh=0fwQmSlkaP5NWFmcWTOC7QiSqCIYeES1elEE5OxzCQA=;
	h=From:To:Cc:Subject:Date:From;
	b=g6NimZUPYQKSjduVkBDIaSonnIVddBWlQ3ReaKe4/c38lLcYdP//MYGVZGeCVjwzi
	 0S0+ZwY/xsk1SrPIwATnzjNKZFbjRWVnFQrinfBW7ZWfIs6B3padbldQiO2VPmFn1Q
	 V/IQuiWbT+pnzvumep1sQ2xEbpM08rApV6/aKI9EoO/kVNkgdXscdtt0d9qqGJYArf
	 iz3sgtndcRG8OnRR6Yx6MhiTfrd5C8uXpnIETH/gwDODnvMApAsuNj+syQHyp5Y4RD
	 gsx58BAU9TyxAvUhiRe/LqzCCDvxg05redmR97+XoIjL5Cmhz0KWyJRXtRRA1OWpsQ
	 YreU5WB8t/Outktk58UzRPaBNb4hu9O/Dkvb3yVinm4RgK+WEnYOByiZiJCMjbN+WP
	 jBAN3QQfWZzjkQxKbHVaXxoiMbNUxcwyNpuEirAoDiL6kGobiD2L2DPwpje9TpCII4
	 UpHRYdOjkpV8OCFCGTRlw3vY+GXJxsW6JhnGkaIgmSBy3SzcdmTWg/s2Y/u0PBOzwZ
	 dPKK2syWyZkIOfgrUVbH2hnrlINwIpugi9VwQ4a6EVh2Y4RSKxRrFyKfcb/frNx2JK
	 VZ3C81Yotpu3MSATYskuQejHlQzmqwbokgde8aIyHjPvpKN2nxsH5hA0dEpWsMT+Tm
	 6lceWDMGXYtBBlqFu17ewLYI=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 5599C1E86C4; Sat,  2 May 2026 10:50:03 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1777690172;
	bh=0fwQmSlkaP5NWFmcWTOC7QiSqCIYeES1elEE5OxzCQA=;
	h=From:To:Cc:Subject:Date:From;
	b=guuXZotP8yWxq1GevCccVJH7J8hDdEKD3F6st8Rlg2VzcwbwkSeElLC9IINQlYnC1
	 jtuUmXZ6DF7CNXSPPuCF9yp7CNz09ujFJk9uSrLPmexSNTE+6rZ8GpQl+aUxkk8msH
	 pKo06R1B4g3BKTEHkNcXB+s7WR0oYCqFO+XYCAEi5XEcdRC8KWWomXYdKYXHKpSiZp
	 th6lT9nXwaN2nEG145C1d3SC4+dl/fePgV5/irkCaOiOfEKyzfzplkZa42emClaJye
	 UAH6Cg2IZqz+YMK4wqOZfltFxyaPWIJUo3gISX2jSVId21quC1htMo6xcr8SyDf6Hx
	 hrF/8IK3GtilTkQvHBZFmdiLt2LVDbD9l8VuDU1TbmqoDfEVo5M3RuGjmvC7rq2ag4
	 IqCesNEpL4ZcVdYWzZSYPVWA+ttRAMeE7iJarLammADlBOfz6HYCGUyDR4R3uNSCOc
	 TKWc+1ABGubU04uEcsRs1Ox+ZQ9v2xKoEJTFBL8MpDGOMuUXF1KXf9OZWMiiSpJ5G+
	 zzvs3HoGNfYAnA+/2gewDIK4LjQTkLuJCXRif+biTJ3k6jUYe0KvY82TKahEbuTMUq
	 nQZPSocOfwsR70TVRF9VfwP6vIWR4gwuQjFTXf/13C6Avc6MJn7RZCXSGrEeU0y/QW
	 3v5N931vU2xIdAZIQOOsX2GI=
Received: from sparky.lan (unknown [IPv6:2001:8003:8810:ea00:ed87:ca88:5326:e11d])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 9C8FE1E86C0;
	Sat,  2 May 2026 10:49:32 +0800 (AWST)
From: David Gow <david@davidgow.net>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: David Gow <david@davidgow.net>,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH v2] kunit: tool: Add (primitive) support for outputting JUnit XML
Date: Sat,  2 May 2026 10:49:17 +0800
Message-ID: <20260502024918.1056954-1-david@davidgow.net>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is used by things like Jenkins and other CI systems, which can
pretty-print the test output and potentially provide test-level comparisons
between runs.

The implementation here is pretty basic: it only provides the raw results,
split into tests and test suites, and doesn't provide any overall metadata.
However, CI systems like Jenkins can injest it and it is already useful.

Signed-off-by: David Gow <david@davidgow.net>
---

Finally got around to doing a new version of this. I'm running this
locally with Jenkins, and it's giving nice summaries of test results.

Changes since v1:
https://lore.kernel.org/all/20260119073426.1952867-1-davidgow@google.com/
- Use python's provided XML quote escaping, rather than coding our own (Thanks Thomas)
- Output proper <skipped> tags for skipped tests
- Report crashed tests as <error>
- Don't output <system-out> tags if there are no lines of log data

---
 Documentation/dev-tools/kunit/run_wrapper.rst |  3 ++
 tools/testing/kunit/kunit.py                  | 25 ++++++++++-
 tools/testing/kunit/kunit_junit.py            | 43 +++++++++++++++++++
 tools/testing/kunit/kunit_tool_test.py        | 38 ++++++++++++++--
 4 files changed, 105 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/kunit/kunit_junit.py

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index 770bb09a475a..cecc110a3399 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -324,6 +324,9 @@ command line arguments:
 - ``--json``: If set, stores the test results in a JSON format and prints to `stdout` or
   saves to a file if a filename is specified.
 
+- ``--junit``: If set, stores the test results in JUnit XML format and prints to `stdout` or
+  saves to a file if a filename is specified.
+
 - ``--filter``: Specifies filters on test attributes, for example, ``speed!=slow``.
   Multiple filters can be used by wrapping input in quotes and separating filters
   by commas. Example: ``--filter "speed>slow, module=example"``.
diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
index 742f5c555666..1a7ff594b791 100755
--- a/tools/testing/kunit/kunit.py
+++ b/tools/testing/kunit/kunit.py
@@ -21,6 +21,7 @@ from enum import Enum, auto
 from typing import Iterable, List, Optional, Sequence, Tuple
 
 import kunit_json
+import kunit_junit
 import kunit_kernel
 import kunit_parser
 from kunit_printer import stdout, null_printer
@@ -49,6 +50,7 @@ class KunitBuildRequest(KunitConfigRequest):
 class KunitParseRequest:
 	raw_output: Optional[str]
 	json: Optional[str]
+	junit: Optional[str]
 	summary: bool
 	failed: bool
 
@@ -268,6 +270,17 @@ def parse_tests(request: KunitParseRequest, metadata: kunit_json.Metadata, input
 			stdout.print_with_timestamp("Test results stored in %s" %
 				os.path.abspath(request.json))
 
+	if request.junit:
+		junit_str = kunit_junit.get_junit_result(
+					test=test)
+		if request.junit == 'stdout':
+			print(junit_str)
+		else:
+			with open(request.junit, 'w') as f:
+				f.write(junit_str)
+			stdout.print_with_timestamp("Test results stored in %s" %
+				os.path.abspath(request.junit))
+
 	if test.status != kunit_parser.TestStatus.SUCCESS:
 		return KunitResult(KunitStatus.TEST_FAILURE, parse_time), test
 
@@ -309,6 +322,7 @@ def run_tests(linux: kunit_kernel.LinuxSourceTree,
 # So we hackily automatically rewrite --json => --json=stdout
 pseudo_bool_flag_defaults = {
 		'--json': 'stdout',
+		'--junit': 'stdout',
 		'--raw_output': 'kunit',
 }
 def massage_argv(argv: Sequence[str]) -> Sequence[str]:
@@ -459,6 +473,11 @@ def add_parse_opts(parser: argparse.ArgumentParser) -> None:
 			    help='Prints parsed test results as JSON to stdout or a file if '
 			    'a filename is specified. Does nothing if --raw_output is set.',
 			    type=str, const='stdout', default=None, metavar='FILE')
+	parser.add_argument('--junit',
+			    nargs='?',
+			    help='Prints parsed test results as JUnit XML to stdout or a file if '
+			    'a filename is specified. Does nothing if --raw_output is set.',
+			    type=str, const='stdout', default=None, metavar='FILE')
 	parser.add_argument('--summary',
 			    help='Prints only the summary line for parsed test results.'
 				'Does nothing if --raw_output is set.',
@@ -502,6 +521,7 @@ def run_handler(cli_args: argparse.Namespace) -> None:
 					jobs=cli_args.jobs,
 					raw_output=cli_args.raw_output,
 					json=cli_args.json,
+					junit=cli_args.junit,
 					summary=cli_args.summary,
 					failed=cli_args.failed,
 					timeout=cli_args.timeout,
@@ -552,6 +572,7 @@ def exec_handler(cli_args: argparse.Namespace) -> None:
 	exec_request = KunitExecRequest(raw_output=cli_args.raw_output,
 					build_dir=cli_args.build_dir,
 					json=cli_args.json,
+					junit=cli_args.junit,
 					summary=cli_args.summary,
 					failed=cli_args.failed,
 					timeout=cli_args.timeout,
@@ -580,7 +601,9 @@ def parse_handler(cli_args: argparse.Namespace) -> None:
 	# We know nothing about how the result was created!
 	metadata = kunit_json.Metadata()
 	request = KunitParseRequest(raw_output=cli_args.raw_output,
-					json=cli_args.json, summary=cli_args.summary,
+					json=cli_args.json,
+					junit=cli_args.junit,
+					summary=cli_args.summary,
 					failed=cli_args.failed)
 	result, _ = parse_tests(request, metadata, kunit_output)
 	if result.status != KunitStatus.SUCCESS:
diff --git a/tools/testing/kunit/kunit_junit.py b/tools/testing/kunit/kunit_junit.py
new file mode 100644
index 000000000000..f5b5080ad715
--- /dev/null
+++ b/tools/testing/kunit/kunit_junit.py
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Generates JUnit XML files from KUnit test results
+#
+# Copyright (C) 2026, Google LLC and David Gow.
+
+from xml.sax.saxutils import quoteattr
+from kunit_parser import Test, TestStatus
+
+# Get a string representing a tes suite (including subtests) in JUnit XML
+def get_test_suite(test: Test) -> str:
+	xml_output = '<testsuite name=' + quoteattr(test.name) + ' tests="' +\
+		str(test.counts.total()) + '" failures="' + str(test.counts.failed) +\
+		'" skipped="' + str(test.counts.skipped) + '" errors="' + str(test.counts.crashed + test.counts.errors) + '">\n'
+
+	for subtest in test.subtests:
+		if subtest.subtests:
+			xml_output += get_test_suite(subtest)
+			continue
+		xml_output += '<testcase name=' + quoteattr(subtest.name) + '>\n'
+		if subtest.status == TestStatus.FAILURE:
+			xml_output += '<failure>Test Failed</failure>\n'
+		elif subtest.status == TestStatus.SKIPPED:
+			xml_output += '<skipped>Test Skipped</skipped>\n'
+		elif subtest.status == TestStatus.TEST_CRASHED:
+			xml_output += '<error>Test Crashed</error>\n'
+
+		if subtest.log:
+			xml_output +=\
+				'<system-out><![CDATA[' + "\n".join(subtest.log) +  ']]></system-out>\n'
+
+		xml_output += '</testcase>\n'
+
+	xml_output += '</testsuite>\n\n'
+
+	return xml_output
+
+# Get a string for an entire XML file for the test structure starting at test
+def get_junit_result(test: Test) -> str:
+	xml_output = '<?xml version="1.0" encoding="UTF-8" ?>\n\n'
+
+	xml_output += get_test_suite(test)
+	return xml_output
diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
index 267c33cecf87..f8a77d7fab38 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -24,6 +24,7 @@ import kunit_config
 import kunit_parser
 import kunit_kernel
 import kunit_json
+import kunit_junit
 import kunit
 from kunit_printer import stdout
 
@@ -676,6 +677,37 @@ class StrContains(str):
 	def __eq__(self, other):
 		return self in other
 
+class KUnitJUnitTest(unittest.TestCase):
+	def setUp(self):
+		self.print_mock = mock.patch('kunit_printer.Printer.print').start()
+		self.addCleanup(mock.patch.stopall)
+
+	def _junit_string(self, log_file):
+		with open(_test_data_path(log_file)) as file:
+			test_result = kunit_parser.parse_run_tests(file, stdout)
+			junit_string = kunit_junit.get_junit_result(
+					test=test_result)
+		return junit_string
+
+	def test_failed_test_junit(self):
+		result = self._junit_string('test_is_test_passed-failure.log')
+		self.assertTrue("<failure>" in result)
+
+	def test_skipped_test_junit(self):
+		result = self._junit_string('test_skip_tests.log')
+		self.assertTrue("<skipped>" in result)
+		self.assertTrue("skipped=\"1\"" in result)
+
+	def test_crashed_test_junit(self):
+		result = self._junit_string('test_kernel_panic_interrupt.log')
+		self.assertTrue("<error>" in result);
+
+	def test_no_tests_junit(self):
+		result = self._junit_string('test_is_test_passed-no_tests_run_with_header.log')
+		self.assertTrue("tests=\"0\"" in result)
+		self.assertFalse("testcase" in result)
+
+
 class KUnitMainTest(unittest.TestCase):
 	def setUp(self):
 		path = _test_data_path('test_is_test_passed-all_passed.log')
@@ -923,7 +955,7 @@ class KUnitMainTest(unittest.TestCase):
 		self.linux_source_mock.run_kernel.return_value = ['TAP version 14', 'init: random output'] + want
 
 		got = kunit._list_tests(self.linux_source_mock,
-				     kunit.KunitExecRequest(None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'suite', False, False, False))
+				     kunit.KunitExecRequest(None, None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'suite', False, False, False))
 		self.assertEqual(got, want)
 		# Should respect the user's filter glob when listing tests.
 		self.linux_source_mock.run_kernel.assert_called_once_with(
@@ -936,7 +968,7 @@ class KUnitMainTest(unittest.TestCase):
 
 		# Should respect the user's filter glob when listing tests.
 		mock_tests.assert_called_once_with(mock.ANY,
-				     kunit.KunitExecRequest(None, None, False, False, '.kunit', 300, 'suite*.test*', '', None, None, 'suite', False, False, False))
+				     kunit.KunitExecRequest(None, None, None, False, False, '.kunit', 300, 'suite*.test*', '', None, None, 'suite', False, False, False))
 		self.linux_source_mock.run_kernel.assert_has_calls([
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite.test*', filter='', filter_action=None, timeout=300),
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite2.test*', filter='', filter_action=None, timeout=300),
@@ -949,7 +981,7 @@ class KUnitMainTest(unittest.TestCase):
 
 		# Should respect the user's filter glob when listing tests.
 		mock_tests.assert_called_once_with(mock.ANY,
-				     kunit.KunitExecRequest(None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'test', False, False, False))
+				     kunit.KunitExecRequest(None, None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'test', False, False, False))
 		self.linux_source_mock.run_kernel.assert_has_calls([
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite.test1', filter='', filter_action=None, timeout=300),
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite.test2', filter='', filter_action=None, timeout=300),
-- 
2.54.0

