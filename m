Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AAB36E48D;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776406287; cv=none; b=u8dJCXRkVAu8FXqVZK7E7SDRD0tm9jF6tIuFxWZM5DTXqaqwpPQPE+WE9+RPGcN11PzD4EHfowOTn8juuTwvu3rBx6Gsvhw7ZUdeeR/cAzgl/f1hR9O2fOhXUhJ5VpmNWA+5JYpRJVGMQD4HT+f0QnSvQ2/vrmSWqUDsku+FxfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776406287; c=relaxed/simple;
	bh=foSitjGjVjWkt3FOsEjErrXwoSNFIILUN9JQwZDwqYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nc7LwFJ5W9rGCcIuzYKhHXE9Goee3lCDZtiv8DyqbRpiuX9uGX/ZcF5zmCgF9ygjOj134EHprztYO01E0ZkFRI70YRCekH7pMrAYsTod9umNW6aRoqrMAP+uYqWhpN9O/NTiZjsOkxlezZBwZP4kmvWq6KGCAg8oPqysBJyOWVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DFPxTZvw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DFPxTZvw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD92C2BCC7;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776406287;
	bh=foSitjGjVjWkt3FOsEjErrXwoSNFIILUN9JQwZDwqYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DFPxTZvwQGNUIJnPeYpr1hWPfNuau/s+OaE7r4iZhlcvof5AaClBHJrh5TKv0p3dy
	 1EYvG5pg5KhL4cqz9899f/pND84Yps4g534GoD6wn5Csirj9CvN5r3KVxUcCKqOkXP
	 w+xvCrdSpbG39ICPqAdK86WHviL50MST1KNIg4hNF6S/heyCvXTPkLMKVRRMcAAaIy
	 1QLtQ2fK1qk61F2d5TTaHZI2UBD0JbpzE06jSHzNrNLBiSY0dHyJYcsxciFEsNy18Y
	 v7zm18JciTmf8qBj2TzRtJZ4e+a9ytK54YadF4i+Cz1zJ9Ib7hb9N3h+ZE+53Qqmn0
	 PMgJhESl3brrQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wDcQH-0000000H8sx-2png;
	Fri, 17 Apr 2026 08:11:25 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Dan Williams <djbw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 09/11] docs: maintainers_include: improve its output
Date: Fri, 17 Apr 2026 08:11:19 +0200
Message-ID: <6912a6a66e6594f10e8ab886a984cf45cbe697c2.1776405189.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776405189.git.mchehab+huawei@kernel.org>
References: <cover.1776405189.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

There are three "types" of profiles:
1. Profiles already included inside subsystem-specific documentation.
   This is the most common case;
2. Profiles that are hosted externally;
3. Profiles that are at the same location as maintainer-handbooks.rst.

For (3), we need to create a TOC, as they don't exist elsewhere.

Change the logic to create TOC just for (3), prepending the
content of maintainer-handbooks with a sorted entry of all types,
before the TOC.

With such change, we can have an unique sorted list of profiles,
having the subsystem names used there listed.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 76 +++++++++++----------
 1 file changed, 40 insertions(+), 36 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 7ab921820612..5413c1350bba 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -21,7 +21,7 @@ import sys
 import re
 import os.path
 
-from textwrap import indent
+from glob import glob
 
 from docutils import statemachine
 from docutils.parsers.rst import Directive
@@ -36,8 +36,8 @@ class MaintainersParser:
     """Parse MAINTAINERS file(s) content"""
 
     def __init__(self, base_path, path):
-        self.profiles = {}
-        self.profile_urls = {}
+        self.profile_toc = set()
+        self.profile_entries = {}
 
         result = list()
         result.append(".. _maintainers:")
@@ -73,26 +73,24 @@ class MaintainersParser:
             # Drop needless input whitespace.
             line = line.rstrip()
 
+            #
+            # Handle profile entries - either as files or as https refs
+            #
             match = re.match(r"P:\s*(Documentation/\S+)\.rst", line)
             if match:
-                fname = os.path.relpath(match.group(1), base_path)
-                if fname.startswith("../"):
-                    if self.profiles.get(fname) is None:
-                        self.profiles[fname] = subsystem_name
-                    else:
-                        self.profiles[fname] += f", {subsystem_name}"
+                entry = os.path.relpath(match.group(1), base_path)
+                if "*" in entry:
+                    for e in glob(entry):
+                        self.profile_toc.add(e)
+                        self.profile_entries[subsystem_name] = e
                 else:
-                    self.profiles[fname] = None
-
-            match = re.match(r"P:\s*(https?://.*)", line)
-            if match:
-                url = match.group(1).strip()
-                if url not in self.profile_urls:
-                    if self.profile_urls.get(url) is None:
-                        self.profile_urls[url] = subsystem_name
-                    else:
-                        self.profile_urls[url] += f", {subsystem_name}"
-
+                    self.profile_toc.add(entry)
+                    self.profile_entries[subsystem_name] = entry
+            else:
+                match = re.match(r"P:\s*(https?://.*)", line)
+                if match:
+                    entry = match.group(1).strip()
+                    self.profile_entries[subsystem_name] = entry
 
             # Linkify all non-wildcard refs to ReST files in Documentation/.
             pat = r'(Documentation/([^\s\?\*]*)\.rst)'
@@ -234,26 +232,32 @@ class MaintainersProfile(Include):
 
         maint = MaintainersParser(base_path, path)
 
-        output  = ".. toctree::\n"
-        output += "   :maxdepth: 1\n\n"
+        #
+        # Produce a list with all maintainer profiles, sorted by subsystem name
+        #
+        output = ""
 
-        items = sorted(maint.profiles.items(),
-                       key=lambda kv: (kv[1] or "", kv[0]))
-        for fname, profile in items:
-            if profile:
-                output += f"   {profile} <{fname}>\n"
+        for profile, entry in maint.profile_entries.items():
+            if entry.startswith("http"):
+                if profile:
+                    output += f"- `{profile} <{entry}>`_\n"
+                else:
+                    output += f"- `<{entry}>_`\n"
             else:
-                output += f"   {fname}\n"
+                if profile:
+                    output += f"- :doc:`{profile} <{entry}>`\n"
+                else:
+                    output += f"- :doc:`<{entry}>`\n"
 
-        output += "\n**External profiles**\n\n"
+        #
+        # Create a hidden TOC table with all profiles. That allows adding
+        # profiles without needing to add them on any index.rst file.
+        #
+        output += "\n.. toctree::\n"
+        output += "   :hidden:\n\n"
 
-        items = sorted(maint.profile_urls.items(),
-                       key=lambda kv: (kv[1] or "", kv[0]))
-        for url, profile in items:
-            if profile:
-                output += f"- {profile} <{url}>\n"
-            else:
-                output += f"- {url}\n"
+        for fname in maint.profile_toc:
+            output += f"   {fname}\n"
 
         output += "\n"
 
-- 
2.53.0

