Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C81333442
	for <workflows@vger.kernel.org>; Sat, 20 Jun 2026 23:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781998867; cv=none; b=UQd9XmLKNvmXjyxxdeyxw3Pw5MtBkTwFDkQVNyJkpNuCBo52inJ3MFjwTgEdQDzp8QUsM9Mb6YziSffnLL/dYhIVBbJs2+Uv1cx0Pn7mh3MeHOBKi1DknrSVjIhv0PIOz4wLj/kqcAVcsWM9Cey7HYPYaUvH9brBO+NVNs0bIbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781998867; c=relaxed/simple;
	bh=EJ+ncXroWLtZ9H7/gwXd9ATkB2lmEAPQ9RDGHXVTYKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C92bM99LyyOSDeF5dvTO31wJ5LsCzekfeLD5zIsYIO/LGGaZW1CyA16FblkVyXHPbzDrTyD7PeiNmUmaHGEjFDd0FMN/7jQG/io0o2TscwjhUrQc3Db9RKyPaCqMAKiM8KWpicronSOBiNpvD3v6fxQLmQAs/Df5IaW13OJUjZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RrMVjZ0F; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RrMVjZ0F"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781998853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lSKWN4XhE0iVF3MV1+FCHMSccBdXHVwnsKiwh7XXNe4=;
	b=RrMVjZ0FwSnuIPgb7jx/LK5EBxNcpdwXEV/Vu776DuVNRlYqeTm2IznPu5bloZ8dQ9h7tO
	vPZ2XpO1Wp0dFcOGF53AlVgVla0lcmSN99Nm+oJ7LjdKeWU7ADKLH9vadmtbNLSq3hVz6d
	uFytfavYR1EE0j9cxB4xz0RF2tuDLmU=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: kgdb-bugreport@lists.sourceforge.net,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jason.wessel@windriver.com,
	danielt@kernel.org,
	dianders@chromium.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH] docs: kgdb: Fix path of driver options
Date: Sun, 21 Jun 2026 07:40:35 +0800
Message-ID: <20260620234035.9917-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The correct path of driver options should be
/sys/module/<driver>/parameters/<option>. Fix it.

Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---
 Documentation/process/debugging/kgdb.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/debugging/kgdb.rst b/Documentation/process/debugging/kgdb.rst
index c4d0a9121d52..316b1d74e9c8 100644
--- a/Documentation/process/debugging/kgdb.rst
+++ b/Documentation/process/debugging/kgdb.rst
@@ -513,7 +513,7 @@ unregister all the kernel hook points.
 
 All kgdb I/O drivers can be reconfigured at run time, if
 ``CONFIG_SYSFS`` and ``CONFIG_MODULES`` are enabled, by echo'ing a new
-config string to ``/sys/module/<driver>/parameter/<option>``. The driver
+config string to ``/sys/module/<driver>/parameters/<option>``. The driver
 can be unconfigured by passing an empty string. You cannot change the
 configuration while the debugger is attached. Make sure to detach the
 debugger with the ``detach`` command prior to trying to unconfigure a
-- 
2.53.0

