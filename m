Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CECA281341
	for <workflows@vger.kernel.org>; Fri, 16 Jan 2026 17:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768585623; cv=none; b=LlM1oOEpfiYrIsupHHMPATtGfesLkf7GNYx435+fLjGGS7+rTIWxa3dYOSReBK/aMqT52KarKS/vsnYkvlRHhvxU6Xxdgjt90q3FS5cLSAusurfSQQD7hlwRM5kHFvxn/qYLkaidnCwz5S+G3J3OpqI67gCpxVae6unUMbLlc8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768585623; c=relaxed/simple;
	bh=S3CI7rQIWs9HJdUvqhIwtwa5rLnoqW9fYA/1FX4zfVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L0GMRM7S7ESIzEdubXw3u03O4/bteoEe+W+Ovu88HpDQeW1Y9WRoswFc39mFeg/3bfu7LE8XiKtkcL8gfgINUoRQqLGzJqnrqhaOgvwa/aXIX34VgQaOUbDJ0mtYM+5R/0GZqbv8cGCLgl1gW2XZfaRdPBVKHcJ5V8/RIWEMTbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NP+GWIyA; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NP+GWIyA"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso15108515ad.1
        for <workflows@vger.kernel.org>; Fri, 16 Jan 2026 09:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768585619; x=1769190419; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bqprM+/fMABEF2BT0yjlCPRYQsErnl1lQWu3bm8SrTk=;
        b=NP+GWIyAZLJui2f3BwvN4yRvYZwfqEG7RZu1EXzvuTFO677zumYUcvZZhN57CyrtrD
         bqVFLtAXXx67z0q7dUn43JdiEBimy90kRnNjD0ZS/YR3f+V7qyPFBskeCR15ikY74qpT
         9qC+fqCflczSvbJm+J0QdMD8sLh7kZntVuCQC+nQjYAmhan/CJaKrw/VZd6V2IERU0of
         fe4sTUymMeQT4LIuCtCVxF9RAHlHdGtdpR9xBvl38ncke/3PDg6FD8SJUg92gIeUfKIA
         oNQ/PU7kFSOO/1rmeyP7NIOY0NLauaCy+51sVmbXmxhvIh5qElOQgFt1e0HK2wz2S20d
         44AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768585619; x=1769190419;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqprM+/fMABEF2BT0yjlCPRYQsErnl1lQWu3bm8SrTk=;
        b=mNbk6vT3xZ/CIiHFy7Dhz+KK3MFb/OlvScxRoGY1GhJcoP5hjja5/jhE9oTMEi16Sn
         Mod4etDv8msbFh5dU65rrmSNVRefzvbBpp8ySQyFtXzUszRvwQhsFuQREf21l/YZ96Rt
         +YSiM6XKf+yc4f90z6/c6K2UL5Si0qoPhxtbAhUzZrM7sw3GUYIKLgP7VE6x9eThxmRU
         P3SAOxrrkilWZ5s6e2WkbyCdn1tXEPM+U0taPk8Z27jcLag09OU/xxaHEJatgCcrcJdH
         K2kTXPzkI6VjOoW09rbwZa5nUSaxAnCB6heLO8+jUuUQnIkqjFiCkujd6Si56c5d2cm3
         y+kg==
X-Forwarded-Encrypted: i=1; AJvYcCXJFGjIjWOaTc77EXj56xAipOwCDCvYqM4GacHvvilfqnzrwTv3E+TQIwEAdJTwuS11ZF9RKNUJTZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQnL1n91v7S5UHIGD6f0CjFmgwWsnrlWLlvb6QadQRftkqEoXa
	ITg7CykMDJchbyeiDzXnRNh79CgKdF/4S71kfvnV0cqJvm84ERvlLgkt
X-Gm-Gg: AY/fxX6lMS9nVqKEhoXfrMiJGdSWoc+Pt1VXWWjTDBW1mxGtRUfXsSZ48+9SyOmMiys
	5RWbpkYMq01sEesNiSpgM8DpVRnIoAAlFZ+HAs381QSBc1NF4LobEi0R+MghikIoapn305Oq00n
	x//CVGNHDdCxk4RaJH2E2ZFwUOmOnei7vsTWpFMm4FDbwJT7yr3iP0jURBa63qf/+3Bqo+QJT6s
	cVUG/nhQvhqfufuxv7VPXEcJox21jGDIZydnUCO0bm4AMrshW3dDXIS2T3ITXXQGakMzv+rnUDC
	mUYb2z5UVkTRA2HMLl7GURp51NFeQpW73O7G8fY08IXbM8AT35Zd6OevFAz+/1FpWFRG3S+TdrL
	4RJgvLteJjQvZdhKsIxNasK1Ul0D3PdeF0J9A0yBw/DGYdIdWGovdqumJ0f/lheOKgpJv+r2Otx
	e11cvOog/Xn20dHNJnewE=
X-Received: by 2002:a17:903:2f82:b0:2a0:992c:c54e with SMTP id d9443c01a7336-2a7177daea5mr34315265ad.48.1768585618643;
        Fri, 16 Jan 2026 09:46:58 -0800 (PST)
Received: from [172.16.80.107] ([210.228.119.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193decfcsm26573895ad.60.2026.01.16.09.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 09:46:58 -0800 (PST)
From: Ryota Sakamoto <sakamo.ryota@gmail.com>
Date: Sat, 17 Jan 2026 02:46:34 +0900
Subject: [PATCH v2] kunit: add bash completion
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-kunit-completion-v2-1-cabd127d0801@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNQQ6DIBREr2L+ujRCgEhXvYdxYfCrP1U0QEkbw
 91LTbrq8k1m3hwQ0BMGuFUHeEwUaHMFxKUCO/duQkZDYRC10DXnkj2ejiKz27ovGEuZCa2axoz
 KWCWgzHaPI71OZdsVninEzb/Ph8S/6U+m/mWJM87kgFppabSw8j6tPS3XUoEu5/wBv+q0ZLAAA
 AA=
X-Change-ID: 20260114-kunit-completion-265889f59c52
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 Ryota Sakamoto <sakamo.ryota@gmail.com>
X-Mailer: b4 0.14.2

Currently, kunit.py has many subcommands and options, making it difficult
to remember them without checking the help message.

Add --list-cmds and --list-opts to kunit.py to get available commands and
options, use those outputs in kunit-completion.sh to show completion.

This implementation is similar to perf and tools/perf/perf-completion.sh.

Example output:
  $ source tools/testing/kunit/kunit-completion.sh
  $ ./tools/testing/kunit/kunit.py [TAB][TAB]
  build   config  exec    parse   run
  $ ./tools/testing/kunit/kunit.py run --k[TAB][TAB]
  --kconfig_add  --kernel_args  --kunitconfig

Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Ryota Sakamoto <sakamo.ryota@gmail.com>
---
Changes in v2:
- Add relative path './tools/testing/kunit/kunit.py' to completion list
- Rebase on kselftest/kunit branch
- Link to v1: https://lore.kernel.org/r/20260115-kunit-completion-v1-1-4de6564962c4@gmail.com
---
 Documentation/dev-tools/kunit/run_wrapper.rst |  9 +++++++
 tools/testing/kunit/kunit-completion.sh       | 34 +++++++++++++++++++++++++++
 tools/testing/kunit/kunit.py                  | 30 +++++++++++++++++++++++
 tools/testing/kunit/kunit_tool_test.py        | 21 +++++++++++++++++
 4 files changed, 94 insertions(+)

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index 6697c71ee8ca020b8ac7e91b46e29ab082d9dea0..3c0b585dcfffbd3929d0eef1ab9376fa4f380872 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -335,3 +335,12 @@ command line arguments:
 
 - ``--list_tests_attr``: If set, lists all tests that will be run and all of their
   attributes.
+
+Command-line completion
+==============================
+
+The kunit_tool comes with a bash completion script:
+
+.. code-block:: bash
+
+	source tools/testing/kunit/kunit-completion.sh
diff --git a/tools/testing/kunit/kunit-completion.sh b/tools/testing/kunit/kunit-completion.sh
new file mode 100644
index 0000000000000000000000000000000000000000..f053e7b5d265aec8317b6eb11c8920063607073f
--- /dev/null
+++ b/tools/testing/kunit/kunit-completion.sh
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0
+# bash completion support for KUnit
+
+_kunit_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
+
+_kunit()
+{
+	local cur prev words cword
+	_init_completion || return
+
+	local script="${_kunit_dir}/kunit.py"
+
+	if [[ $cword -eq 1 && "$cur" != -* ]]; then
+		local cmds=$(${script} --list-cmds 2>/dev/null)
+		COMPREPLY=($(compgen -W "${cmds}" -- "$cur"))
+		return 0
+	fi
+
+	if [[ "$cur" == -* ]]; then
+		if [[ -n "${words[1]}" && "${words[1]}" != -* ]]; then
+			local opts=$(${script} ${words[1]} --list-opts 2>/dev/null)
+			COMPREPLY=($(compgen -W "${opts}" -- "$cur"))
+			return 0
+		else
+			local opts=$(${script} --list-opts 2>/dev/null)
+			COMPREPLY=($(compgen -W "${opts}" -- "$cur"))
+			return 0
+		fi
+	fi
+}
+
+complete -o default -F _kunit kunit.py
+complete -o default -F _kunit kunit
+complete -o default -F _kunit ./tools/testing/kunit/kunit.py
diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
index e3d82a038f93df0e86952da92461bc2e02f69ed1..4ec5ecba6d49b1ba3360515a2b66a2a98813bd18 100755
--- a/tools/testing/kunit/kunit.py
+++ b/tools/testing/kunit/kunit.py
@@ -328,6 +328,17 @@ def get_default_build_dir() -> str:
 		return os.path.join(os.environ['KBUILD_OUTPUT'], '.kunit')
 	return '.kunit'
 
+def add_completion_opts(parser: argparse.ArgumentParser) -> None:
+	parser.add_argument('--list-opts',
+			    help=argparse.SUPPRESS,
+			    action='store_true')
+
+def add_root_opts(parser: argparse.ArgumentParser) -> None:
+	parser.add_argument('--list-cmds',
+			    help=argparse.SUPPRESS,
+			    action='store_true')
+	add_completion_opts(parser)
+
 def add_common_opts(parser: argparse.ArgumentParser) -> None:
 	parser.add_argument('--build_dir',
 			    help='As in the make command, it specifies the build '
@@ -379,6 +390,8 @@ def add_common_opts(parser: argparse.ArgumentParser) -> None:
 			    help='Additional QEMU arguments, e.g. "-smp 8"',
 			    action='append', metavar='')
 
+	add_completion_opts(parser)
+
 def add_build_opts(parser: argparse.ArgumentParser) -> None:
 	parser.add_argument('--jobs',
 			    help='As in the make command, "Specifies  the number of '
@@ -574,6 +587,7 @@ subcommand_handlers_map = {
 def main(argv: Sequence[str]) -> None:
 	parser = argparse.ArgumentParser(
 			description='Helps writing and running KUnit tests.')
+	add_root_opts(parser)
 	subparser = parser.add_subparsers(dest='subcommand')
 
 	# The 'run' command will config, build, exec, and parse in one go.
@@ -608,12 +622,28 @@ def main(argv: Sequence[str]) -> None:
 	parse_parser.add_argument('file',
 				  help='Specifies the file to read results from.',
 				  type=str, nargs='?', metavar='input_file')
+	add_completion_opts(parse_parser)
 
 	cli_args = parser.parse_args(massage_argv(argv))
 
 	if get_kernel_root_path():
 		os.chdir(get_kernel_root_path())
 
+	if cli_args.list_cmds:
+		print(" ".join(subparser.choices.keys()))
+		return
+
+	if cli_args.list_opts:
+		target_parser = subparser.choices.get(cli_args.subcommand)
+		if not target_parser:
+			target_parser = parser
+
+		# Accessing private attribute _option_string_actions to get
+		# the list of options. This is not a public API, but argparse
+		# does not provide a way to inspect options programmatically.
+		print(' '.join(target_parser._option_string_actions.keys()))
+		return
+
 	subcomand_handler = subcommand_handlers_map.get(cli_args.subcommand, None)
 
 	if subcomand_handler is None:
diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
index 238a31a5cc291854bb8738f22e04c65bcbaeb11c..b67408147c1faaab12b168aabe3bfba8bf1b00aa 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -11,11 +11,13 @@ from unittest import mock
 
 import tempfile, shutil # Handling test_tmpdir
 
+import io
 import itertools
 import json
 import os
 import signal
 import subprocess
+import sys
 from typing import Iterable
 
 import kunit_config
@@ -886,5 +888,24 @@ class KUnitMainTest(unittest.TestCase):
 			mock.call(args=None, build_dir='.kunit', filter_glob='suite2.test1', filter='', filter_action=None, timeout=300),
 		])
 
+	@mock.patch.object(sys, 'stdout', new_callable=io.StringIO)
+	def test_list_cmds(self, mock_stdout):
+		kunit.main(['--list-cmds'])
+		output = mock_stdout.getvalue()
+		output_cmds = sorted(output.split())
+		expected_cmds = sorted(['build', 'config', 'exec', 'parse', 'run'])
+		self.assertEqual(output_cmds, expected_cmds)
+
+	@mock.patch.object(sys, 'stdout', new_callable=io.StringIO)
+	def test_run_list_opts(self, mock_stdout):
+		kunit.main(['run', '--list-opts'])
+		output = mock_stdout.getvalue()
+		output_cmds = set(output.split())
+		self.assertIn('--help', output_cmds)
+		self.assertIn('--kunitconfig', output_cmds)
+		self.assertIn('--jobs', output_cmds)
+		self.assertIn('--kernel_args', output_cmds)
+		self.assertIn('--raw_output', output_cmds)
+
 if __name__ == '__main__':
 	unittest.main()

---
base-commit: f126d688193b4dd6d0044c19771469724c03f8f8
change-id: 20260114-kunit-completion-265889f59c52

Best regards,
-- 
Ryota Sakamoto <sakamo.ryota@gmail.com>

