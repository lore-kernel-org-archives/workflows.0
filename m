Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91FB36E497;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776406287; cv=none; b=Ypt0kqoP00RjD4W1yJQfEJX72FCXn2TvO8iBK9jhcpqex3B+qbi02dJPFkC4RnYXF4xMH6g9G5LS90LGcwtdl7sG6R9qihVnFIEoohb/BZB2+o3Zq929ZdqVaRuECk6pvSxJgBUehnM9ZNOMbbcisz/YGfthXmFZtN2yNTHkBRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776406287; c=relaxed/simple;
	bh=PN4FPVYRORp3XTpdvjjtDtB0ZIfuMMKyf0YVAqRdNAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T/wvKDzFvKedOre6qZkGwGezhyRuhXR4aU1xmvUDD9+mPOlpbnG4qKknFzSA5XiV45wkVefNSTb4Vlfu7TXSMJilQGPh6zmVu8M79Vla+gsCpMSCW3yhluzRwC93AByhgaHz5csDlFj05O+V9M5/yGN5lWbBjflBvfOP2RyQOMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHMZ0riZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHMZ0riZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CE2C2BCC4;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776406287;
	bh=PN4FPVYRORp3XTpdvjjtDtB0ZIfuMMKyf0YVAqRdNAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QHMZ0riZ9BRt2dZbbm9yBkzv7KTSjwRaCViZzlbGUhUbRAmrRLTgTAEe/NOCNd+2W
	 GaUjkvqSnkxfXyKCPbVMGPbdBlqD7NRLUmhdrSLkSOkICM1AMhgBVMnavFPSLHuCYC
	 I8GkM5xV6C5ArUNfDgtu8gsZV6g/vt5oUKi/iF7EyW69oUfm1ePIi9Hm5YF5Y+k5+Q
	 /XSS+zHWVW3b148HO3mPSDE0rOveEJ6IeoEmegBMG2Tt+hSEBC+JXKMYwC1MQN4I0K
	 /vdbz3VwmsqrFWHAsasppLZvKDOaQp+2OEGnwC9vFCg3qqeePw0kzDpcE+btwUGWIc
	 agwPI8Y60ADTQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wDcQH-0000000H8sl-2UKI;
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
Subject: [PATCH v2 06/11] docs: maintainers_include: add external profile URLs
Date: Fri, 17 Apr 2026 08:11:16 +0200
Message-ID: <b1ac2fcb4e6eecb138291e06efe11142a0bea47d.1776405189.git.mchehab+huawei@kernel.org>
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

Some subsystem profiles are maintained elsewhere. Add them to
the output.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 28 +++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index cf428db7599c..f1b8d4b00c2a 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -37,6 +37,7 @@ class MaintainersParser:
 
     def __init__(self, base_path, path):
         self.profiles = {}
+        self.profile_urls = {}
 
         result = list()
         result.append(".. _maintainers:")
@@ -81,6 +82,16 @@ class MaintainersParser:
                     else:
                         self.profiles[fname] += f", {subsystem_name}"
 
+            match = re.match(r"P:\s*(https?://.*)", line)
+            if match:
+                url = match.group(1).strip()
+                if url not in self.profile_urls:
+                    if self.profile_urls.get(url) is None:
+                        self.profile_urls[url] = subsystem_name
+                    else:
+                        self.profile_urls[url] += f", {subsystem_name}"
+
+
             # Linkify all non-wildcard refs to ReST files in Documentation/.
             pat = r'(Documentation/([^\s\?\*]*)\.rst)'
             m = re.search(pat, line)
@@ -219,18 +230,31 @@ class MaintainersProfile(Include):
     def emit(self, base_path, path):
         """Parse all the MAINTAINERS lines looking for profile entries"""
 
-        profiles = MaintainersParser(base_path, path).profiles
+        maint = MaintainersParser(base_path, path)
 
         output  = ".. toctree::\n"
         output += "   :maxdepth: 2\n\n"
 
-        items = sorted(profiles.items(), key=lambda kv: (kv[1] or "", kv[0]))
+        items = sorted(maint.profiles.items(),
+                       key=lambda kv: (kv[1] or "", kv[0]))
         for fname, profile in items:
             if profile:
                 output += f"   {profile} <{fname}>\n"
             else:
                 output += f"   {fname}\n"
 
+        output += "\n**External profiles**\n\n"
+
+        items = sorted(maint.profile_urls.items(),
+                       key=lambda kv: (kv[1] or "", kv[0]))
+        for url, profile in items:
+            if profile:
+                output += f"- {profile} <{url}>\n"
+            else:
+                output += f"- {url}\n"
+
+        output += "\n"
+
         self.state_machine.insert_input(statemachine.string2lines(output), path)
 
     def run(self):
-- 
2.53.0

