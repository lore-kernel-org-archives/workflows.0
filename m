Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C083D5230;
	Wed, 15 Apr 2026 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243150; cv=none; b=sG1ikHh8W+9g5gS9PhIrpbcQiRkjIyEJkkUD2Fr528RDexa9BRvm7kzmz1GEUXvFF7oikpUEsUdBVtuX1oiGKizgxBXpDNOOTZVN28MFkvp2YuS+8fZd+4tcZ5ScJT8UiraaFGRtvGgkXP5joXP5ey/sflrs09xb+l8/3RN0B9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243150; c=relaxed/simple;
	bh=NuYk28Zg9NLnbQ4d/3en1YVQRZ/qBlcvUunSiLU9FFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Px81GjIIoiy6i0hZMtWLHTBRKlYAoYTUVkpdVX8gaJx4fN9yj+i4ZDZjDoXN8LV153Mlrq2QqJ+aB/bYRnTU6AMYOdi9l9+uZIBun2GMwLkCNxqBtMk6kIZhchDAXJkl87qd2NySlimMXmtb9Bk9oVTtrYSyaRw/rZxFhW+8cCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEWG5QFJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEWG5QFJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97CEBC2BCB9;
	Wed, 15 Apr 2026 08:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776243149;
	bh=NuYk28Zg9NLnbQ4d/3en1YVQRZ/qBlcvUunSiLU9FFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iEWG5QFJonCagHxjCwWmq3nQmc1vL8iCOclwp3pq4z6nNPhE2NunyZ1SPkj6TENde
	 356oWQ+8O5owQF7j67H6sTp49egpkmwgW0JfRDR//hYJ/LDbYx12SHtx5TnpuWFhCf
	 pqiTJgYOjCEfARxc6EO0KE4cRMQU4Z31a0A17sMPhZUlVbnXjovQYL10UHGyJ7uSa+
	 Dj1voZyznbNLT7RJ0veFvpMewM/7v1RcUQMicwo+7ExZ3WcaDjxH3J4pJWeJLkVXf6
	 OwXc709QcWmzt7ICXFWHwJBKhaIse6HZIFAQRTlo+O/N4+RGWcg4Y42HPjjUeT2EO6
	 VnYHf2b39YYxA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wCvz1-0000000ELw5-2kUJ;
	Wed, 15 Apr 2026 10:52:27 +0200
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
Subject: [PATCH 5/8] docs: maintainers_include: use a better title for profiles
Date: Wed, 15 Apr 2026 10:52:21 +0200
Message-ID: <c5b370f133b0fd90716b3f53ffaf396081fd58ec.1776242739.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776242739.git.mchehab+huawei@kernel.org>
References: <cover.1776242739.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

As we're picking the name of the subsystem from MAINTAINERS,
also use its subsystem name for the titles.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 1dac83bf1a65..cf428db7599c 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -36,7 +36,7 @@ class MaintainersParser:
     """Parse MAINTAINERS file(s) content"""
 
     def __init__(self, base_path, path):
-        self.profiles = list()
+        self.profiles = {}
 
         result = list()
         result.append(".. _maintainers:")
@@ -54,6 +54,7 @@ class MaintainersParser:
         prev = None
         field_prev = ""
         field_content = ""
+        subsystem_name = None
 
         for line in open(path):
             # Have we reached the end of the preformatted Descriptions text?
@@ -75,7 +76,10 @@ class MaintainersParser:
             if match:
                 fname = os.path.relpath(match.group(1), base_path)
                 if fname not in self.profiles:
-                    self.profiles.append(fname)
+                    if self.profiles.get(fname) is None:
+                        self.profiles[fname] = subsystem_name
+                    else:
+                        self.profiles[fname] += f", {subsystem_name}"
 
             # Linkify all non-wildcard refs to ReST files in Documentation/.
             pat = r'(Documentation/([^\s\?\*]*)\.rst)'
@@ -112,6 +116,8 @@ class MaintainersParser:
                     output = field_content + "\n\n"
                     field_content = ""
 
+                    subsystem_name = line.title()
+
                     # Collapse whitespace in subsystem name.
                     heading = re.sub(r"\s+", " ", line)
                     output = output + "%s\n%s" % (heading, "~" * len(heading))
@@ -217,7 +223,13 @@ class MaintainersProfile(Include):
 
         output  = ".. toctree::\n"
         output += "   :maxdepth: 2\n\n"
-        output += indent("\n".join(profiles), "   ")
+
+        items = sorted(profiles.items(), key=lambda kv: (kv[1] or "", kv[0]))
+        for fname, profile in items:
+            if profile:
+                output += f"   {profile} <{fname}>\n"
+            else:
+                output += f"   {fname}\n"
 
         self.state_machine.insert_input(statemachine.string2lines(output), path)
 
-- 
2.53.0

