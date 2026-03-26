Received: from relay.smtp-ext.broadcom.com (lpdvsmtp10.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97829384241;
	Thu, 26 Mar 2026 23:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774567962; cv=none; b=qPZldUFejM/qixYYr3uOUwy3lqtSLzMwlslMHXCvZ4q7m+gHzoTp85Ey58u1wuIvcdbRJ/NzqhbYw9XHF3SgZZwQr6sr5XYyXlGDc4GAMtxlEQIi7Bas+ldJkSZ/56/2VCxM+H7jaBQstVfpExX3Uu2+3/dSRK8aq9X3jphaZPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774567962; c=relaxed/simple;
	bh=NfmBRDo8TFkbFoBY8cJHf1r3vXiAbnmMTqkVPnz/Nok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H6BStQ4sY7FRY9C+GakoT4NKP3bb3KU00PQGMoVtlV/GMMiMkB6LGjCJcJ5BklIVWbKm3JZ4eMAMucYRDpWgkLh6NceczWTQRr3CsyCc8L7b5VYbTflz7zl/XzUIQzvLSUgTnwwoQO4wBzW1RzbEium/OjgUoYLZLTKP9LYh1aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=A0tKFHkm; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="A0tKFHkm"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 4636EC00080B;
	Thu, 26 Mar 2026 16:32:38 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 4636EC00080B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1774567958;
	bh=NfmBRDo8TFkbFoBY8cJHf1r3vXiAbnmMTqkVPnz/Nok=;
	h=From:To:Cc:Subject:Date:From;
	b=A0tKFHkmlWmS7npft1/IcDPUYoYs0nRCmyGwNLiPukj2PvYjLbL3E4fGQ6FG15cHY
	 Df64dpvG3Kw8v6nS4YhcWIFHb1XLTT/49CADp2j+G+R4UbggYQ1ulgip0OXPS84/z2
	 9moH+rFQSKFXnU5qTPDEcS7G19aqtNNdU6G85h7E=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id E7F57B6B;
	Thu, 26 Mar 2026 16:32:37 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Cc: tglx@kernel.org,
	radu@rendec.net,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Illia Ostapyshyn <illia@yshyn.com>,
	workflows@vger.kernel.org (open list:DOCUMENTATION PROCESS),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH] Documentation: Provide hints on how to debug Python GDB scripts
Date: Thu, 26 Mar 2026 16:32:24 -0700
Message-ID: <20260326233226.2248817-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default GDB does not print a full stack of its integrated Python
interpreter, thus making the debugging of GDB scripts more painful than
it has to be.

Suggested-by: Radu Rendec <radu@rendec.net>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 Documentation/process/debugging/gdb-kernel-debugging.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/process/debugging/gdb-kernel-debugging.rst b/Documentation/process/debugging/gdb-kernel-debugging.rst
index 9475c759c722..53e225760a4d 100644
--- a/Documentation/process/debugging/gdb-kernel-debugging.rst
+++ b/Documentation/process/debugging/gdb-kernel-debugging.rst
@@ -173,3 +173,12 @@ this is just a snapshot of the initial version::
 
 Detailed help can be obtained via "help <command-name>" for commands and "help
 function <function-name>" for convenience functions.
+
+Debugging GDB scripts
+---------------------
+
+GDB does not enable a full Python backtrace which can make debugging GDB
+scripts more difficult than necessary. The following will allow for printing a
+full backtrace of the python environment::
+
+ (gdb) set python print-stack full
-- 
2.43.0

