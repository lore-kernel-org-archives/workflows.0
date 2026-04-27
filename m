Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1FE3D34BA;
	Mon, 27 Apr 2026 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299755; cv=none; b=JralyUHY6Ni+cCSnzT/mHCNgvRjRMZ9AMZOTL71Gn+Dcs0LgJVz9iAdIUU5K61Sjr4OBZienwW/aono9THS0JW4mqHBWdJrIP7O5BMZAvd+n9Ei9yUqF9MvG4YYBuXlXiAOa+Mk34FuqNVAvwjg0cDzOyPvKtQW1jNxbXMjgH1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299755; c=relaxed/simple;
	bh=yDbfJtWAfvQ/qhk2RPsW8RGaJCDeeTNMtQ/iIuIjsIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gRF9sIaOv1JW0863wpd3lIkv0wsKnASy6L0cCBxhNH8ZpjcTNh5gwPdJIY8nnF8VhH2ovCSo1zncNlVskl7Nbyw4cz2UfGPwBbCjxtIUSp9p0iR6oi3/wnZhT6BIhzNGgsG6v7iGHg1HYL3GE5O7bZ5A2rmf0AVMnz6lxIyTK28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mz1ODkev; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mz1ODkev"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F96BC2BCB7;
	Mon, 27 Apr 2026 14:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299755;
	bh=yDbfJtWAfvQ/qhk2RPsW8RGaJCDeeTNMtQ/iIuIjsIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mz1ODkevkS59ZL/Qj3MnHx1QPKpMvCimI0lPx3/AITa2C88Ll99AX9eIVgptSFKxt
	 0SXMGaMcxCTIA/RBDDrkYLK2lmD2Sc5Z3TzH+/07trUaV+GFns6NbJd1qQlpLLzRl6
	 sIEm+PmJFYZn11iJnhqIU+c+tjUcuJWLmaBrpJSNI+250R1k+a80xfzRzfi+m0Zljn
	 Grj7v9UzerlRN402+lmg2Gtsn3+ULQ0I3QS3qTL00lmRRM3RIUyUchF+bMzfczZzSh
	 GjZEJl046o3yqiPhb8GMtrSQ2XpnxkDhDDVB7ouzRNUB/wSesuc9w+BKVy9baVZGsC
	 83YAcZCVaSXIA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHMr3-0000000C8RI-3LGz;
	Mon, 27 Apr 2026 16:22:33 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dan Williams <djbw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v4 02/10] docs: maintainers_include: auto-generate maintainer profile TOC
Date: Mon, 27 Apr 2026 16:22:20 +0200
Message-ID: <eac5fb166bcbf0f267e762d72b150bbf248ff057.1777295258.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777295258.git.mchehab+huawei@kernel.org>
References: <cover.1777295258.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Add a feature to allow auto-generating media entry profiles from the
corresponding field inside MAINTAINERS file(s).

Suggested-by: Dan Williams <djbw@kernel.org>
Closes: https://lore.kernel.org/linux-doc/69dd6299440be_147c801005b@djbw-dev.notmuch/
Acked-by: Dan Williams <djbw@kernel.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <4e9512a3d05942c98361d06d60a118d7c78762b6.1776176108.git.mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 93 +++++++++++++++++----
 1 file changed, 76 insertions(+), 17 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 519ad18685b2..1dac83bf1a65 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -21,6 +21,8 @@ import sys
 import re
 import os.path
 
+from textwrap import indent
+
 from docutils import statemachine
 from docutils.parsers.rst import Directive
 from docutils.parsers.rst.directives.misc import Include
@@ -30,20 +32,11 @@ def ErrorString(exc):  # Shamelessly stolen from docutils
 
 __version__  = '1.0'
 
-def setup(app):
-    app.add_directive("maintainers-include", MaintainersInclude)
-    return dict(
-        version = __version__,
-        parallel_read_safe = True,
-        parallel_write_safe = True
-    )
+class MaintainersParser:
+    """Parse MAINTAINERS file(s) content"""
 
-class MaintainersInclude(Include):
-    """MaintainersInclude (``maintainers-include``) directive"""
-    required_arguments = 0
-
-    def parse_maintainers(self, path):
-        """Parse all the MAINTAINERS lines into ReST for human-readability"""
+    def __init__(self, base_path, path):
+        self.profiles = list()
 
         result = list()
         result.append(".. _maintainers:")
@@ -78,6 +71,12 @@ class MaintainersInclude(Include):
             # Drop needless input whitespace.
             line = line.rstrip()
 
+            match = re.match(r"P:\s*(Documentation/\S+)\.rst", line)
+            if match:
+                fname = os.path.relpath(match.group(1), base_path)
+                if fname not in self.profiles:
+                    self.profiles.append(fname)
+
             # Linkify all non-wildcard refs to ReST files in Documentation/.
             pat = r'(Documentation/([^\s\?\*]*)\.rst)'
             m = re.search(pat, line)
@@ -165,12 +164,23 @@ class MaintainersInclude(Include):
             for separated in field_content.split('\n'):
                 result.append(separated)
 
-        output = "\n".join(result)
+        self.output = "\n".join(result)
+
+        # Create a TOC class
+
+class MaintainersInclude(Include):
+    """MaintainersInclude (``maintainers-include``) directive"""
+    required_arguments = 0
+
+    def emit(self, base_path, path):
+        """Parse all the MAINTAINERS lines into ReST for human-readability"""
+
+        output = MaintainersParser(base_path, path).output
+
         # For debugging the pre-rendered results...
         #print(output, file=open("/tmp/MAINTAINERS.rst", "w"))
 
-        self.state_machine.insert_input(
-          statemachine.string2lines(output), path)
+        self.state_machine.insert_input(statemachine.string2lines(output), path)
 
     def run(self):
         """Include the MAINTAINERS file as part of this reST file."""
@@ -186,12 +196,61 @@ class MaintainersInclude(Include):
 
         # Append "MAINTAINERS"
         path = os.path.join(path, "MAINTAINERS")
+        base_path = os.path.dirname(self.state.document.document.current_source)
 
         try:
             self.state.document.settings.record_dependencies.add(path)
-            lines = self.parse_maintainers(path)
+            lines = self.emit(base_path, path)
         except IOError as error:
             raise self.severe('Problems with "%s" directive path:\n%s.' %
                       (self.name, ErrorString(error)))
 
         return []
+
+class MaintainersProfile(Include):
+    required_arguments = 0
+
+    def emit(self, base_path, path):
+        """Parse all the MAINTAINERS lines looking for profile entries"""
+
+        profiles = MaintainersParser(base_path, path).profiles
+
+        output  = ".. toctree::\n"
+        output += "   :maxdepth: 2\n\n"
+        output += indent("\n".join(profiles), "   ")
+
+        self.state_machine.insert_input(statemachine.string2lines(output), path)
+
+    def run(self):
+        """Include the MAINTAINERS file as part of this reST file."""
+        if not self.state.document.settings.file_insertion_enabled:
+            raise self.warning('"%s" directive disabled.' % self.name)
+
+        # Walk up source path directories to find Documentation/../
+        path = self.state_machine.document.attributes['source']
+        path = os.path.realpath(path)
+        tail = path
+        while tail != "Documentation" and tail != "":
+            (path, tail) = os.path.split(path)
+
+        # Append "MAINTAINERS"
+        path = os.path.join(path, "MAINTAINERS")
+        base_path = os.path.dirname(self.state.document.document.current_source)
+
+        try:
+            self.state.document.settings.record_dependencies.add(path)
+            lines = self.emit(base_path, path)
+        except IOError as error:
+            raise self.severe('Problems with "%s" directive path:\n%s.' %
+                      (self.name, ErrorString(error)))
+
+        return []
+
+def setup(app):
+    app.add_directive("maintainers-include", MaintainersInclude)
+    app.add_directive("maintainers-profile-toc", MaintainersProfile)
+    return dict(
+        version = __version__,
+        parallel_read_safe = True,
+        parallel_write_safe = True
+    )
-- 
2.53.0

