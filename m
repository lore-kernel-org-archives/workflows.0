Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4A22264C7
	for <workflows@vger.kernel.org>; Wed, 24 Jun 2026 01:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782265136; cv=none; b=Sa0ZKnizx+klkEh6AjT9O7eeSfpIWKuxjMc6205SROgvKA6oYBcxvDC5SGMTZ9oxbTHd+PwMKcBruWiil3PG386XYD6uEPrQSj/wdKqBYR3ZkY+swWlE2zLxgMRWzM7+Y4VXF6PCxVF/+0anFlveO10moixJKfmg1FFWNSbqdBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782265136; c=relaxed/simple;
	bh=LuenfKuE2XF9i6IuQPIldaiUHoOlOAgK6Sr1AFryE9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ITUnJ6w05p7p8HnhH0s9GFxMJU7wSWa2jQ2qq8bwMg3/cdbS2iy4AK73SSU+UoxaW6dM2w0gfEFmH5jG9ELicUSHsBlNpweKQFXgf6f6bu219lY7ddMl3aHQkIxdwey+bIDsF726xbuB5QIujE2Ysvt8MSSLsN3lr0b0RO1O7F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agloJ5ob; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agloJ5ob"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30b9e755555so1009686eec.1
        for <workflows@vger.kernel.org>; Tue, 23 Jun 2026 18:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782265134; x=1782869934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WfRNCmPCt9LvTDCCGINPsDLcIaMHwr+ZAPWGB2/yR1c=;
        b=agloJ5obW3+n1fZzKWYWarfzY6gjWCM0jLZk53kHknOBUGD7PckJvt3/LU78t2N3u8
         8jpOxYnT8cCNDBZ1fWwP+33Cdpx6YqDBobHJ/hwqVY+cM/dLtjmj23RG5SsMcQtaNs5b
         COCytL0rY4U31b0rqtj8K9CmPTV7diC7ywFUBETjKwo8wm9KENg5vAKidY6/73/D6L27
         Dg0Jbd5q1qrXjaM/WNS6yZXGjGrK89JiTKWL2aZf12jvbY0gbOo77Sb1XUOuOkBsZ87j
         kA1uutgjImC8MBwgHuR1Ae4HoyRDGOADxjXpMPr7QopSV3c1/dLu3glfA3vZWPVfgQUv
         3K6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782265134; x=1782869934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfRNCmPCt9LvTDCCGINPsDLcIaMHwr+ZAPWGB2/yR1c=;
        b=s0dL6ik37dVgVdyAtXvNMmph3vWHUHBpQAHDOqqGT63piRE9IcQGkqxrIsEhKiqUB4
         HPAQmrkAIoxOpFBgbQACpXnZkaT4t0A1xFLUTLOTqlb/Y8Sig5yycpIjO0fGL8EGZE9w
         rXYrU6kWxvTd3M7yoOqc8aM8TOnb1+/7R16jKYs+1IamxjVPxgyq7Hsv7dWFoULcLUDn
         Ej4998rwUyOyzHgmW61c+u6Ahu/VsUKom6ISQYEXExskOEo/UFqgIWhyaebSI+G7jmxO
         i3gG32Y+GmseLCSOzMZOdH1R7GFRszh/iB8q5FrQFniKlYqIzHo1haokFGgjfdP0z8Sb
         jI7w==
X-Forwarded-Encrypted: i=1; AHgh+RoLgp2kz0Xxfu1nLD4MOUqsQ/9yG4QezYjdMApFCbM9UH3gw7b1fr1gKlutvuHRN6Uscd7JJND5Otk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvwkEXzzJ8ECRT+MBJSSDuve3z8eUPJhh8hMzmD1VKZRV8lwxd
	399FuMcvwKGBnf7AN/LN0JRgNfVFhnfGyNaqSq7TBO1SCKfy/CS1MfKb
X-Gm-Gg: AfdE7cl8R4CZ6g0EAU6C8Kbz9qiOQIi1ZeEwDPfKoy8HtW6EUPb5Z7HJ3o0kg4rzONd
	jXY2ti2bJTMRNHH5eGJcvyB16OT2pblub01KcocyoUNSNXu559X2TYLUXB2RMIXhHzsYXcqoJ/t
	FJrCnEB5CTyVAMnxBH9zOvMZaTMY766kDl0l/SQ8zU0oeLsJFH9UDG6SsxO+czIsQLkNhAG3TO2
	Aj3sgIjLbpifG5ezpoYZ+Nr7/8kBJqWQTu6zRkzW5/M0IJYuEnw4l7t48PNcJsK+Npg4cGKZcgl
	imHdQJr2ULQ4uI2QF4sBylwiJ+drDlT+kSM4Lp0heXxfR5ZGzu8HhUYPm8m8oCHgRMvHKcG9qQA
	vl0mipoeY9jhuCs+D3xhBEWS0HMYoP6ba0ADypVGiZaJo9R023xq80EVRbY5LbdWNL/+lkL1/RJ
	HEOI8Reg==
X-Received: by 2002:a05:7300:3081:b0:30c:536e:3a8e with SMTP id 5a478bee46e88-30c68c421aamr1693118eec.7.1782265134083;
        Tue, 23 Jun 2026 18:38:54 -0700 (PDT)
Received: from localhost ([2a09:bac5:55fa:18be::277:a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba57dc4sm19297898eec.9.2026.06.23.18.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 18:38:53 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Guillaume Tucker <gtucker@gtucker.io>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	workflows@vger.kernel.org (open list:DOCUMENTATION PROCESS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] Documentation: dev-tools: scripts/container prefers Podman
Date: Wed, 24 Jun 2026 09:38:50 +0800
Message-ID: <20260624013850.1853171-1-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obviously scripts/container prefers Podman over Docker. Putting podman
before docker also makes it consistent with following parts of the doc
and the help text of the tool.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 Documentation/dev-tools/container.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/container.rst b/Documentation/dev-tools/container.rst
index 452415b64662..9e23f79d5ae1 100644
--- a/Documentation/dev-tools/container.rst
+++ b/Documentation/dev-tools/container.rst
@@ -40,7 +40,7 @@ Available options:
 
 ``-r, --runtime RUNTIME``
 
-    Container runtime name.  Supported runtimes: ``docker``, ``podman``.
+    Container runtime name.  Supported runtimes: ``podman``, ``docker``.
 
     If not specified, the first one found on the system will be used
     i.e. Podman if present, otherwise Docker.
@@ -75,8 +75,8 @@ working directory and adjust the user and group id as needed.
 
 The container image which would typically include a compiler toolchain is
 provided by the user and selected via the ``-i`` option.  The container runtime
-can be selected with the ``-r`` option, which can be either ``docker`` or
-``podman``.  If none is specified, the first one found on the system will be
+can be selected with the ``-r`` option, which can be either ``podman`` or
+``docker``.  If none is specified, the first one found on the system will be
 used while giving priority to Podman.  Support for other runtimes may be added
 later depending on their popularity among users.
 
-- 
2.54.0

