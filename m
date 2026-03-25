Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A111833A00C;
	Wed, 25 Mar 2026 19:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774468071; cv=none; b=Ol5K7oFm7atCYBahzihfrKieM0sOw3Uldi/GFQnu2rgKgWG+HkdDc2sQjHYTUxOwO3kac+XKkzMVP5kW6xSFTxoXzV687Zh9+4+6IZlX2cq8NOBWFJHa7V46pOZy96IPi9TNzpOBu5ea/0etPCJxiBUjVBTY67NtOj+qv0zstn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774468071; c=relaxed/simple;
	bh=RF0CnEYnIZ4btEI/gTu5z5YRiDXfIoDh2zqZrjWIYqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ftv6ikvHfWxqZDUaBUHHEZpG2IP3DL+d1dgUBV8+JPNAPf34EERXZRzFFW8ozKbNv5clZtJ/SsesNo3etnKHaVmmeGI5lFYva5ZB06AASGkd8YBlsP7tszvIE3Whb4aOj9XlJUyGbbm57HnEMVeVATr3LaOgMsU64PD+JbfSm8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=o3RotQ5q; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Zvy+CFyb; arc=none smtp.client-ip=91.198.250.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="o3RotQ5q";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Zvy+CFyb"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4fgy9v48jwzB115;
	Wed, 25 Mar 2026 20:47:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774468067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZ0CsUOUrkvEVaQ4zcstJWXCS82MQpXISNdXEbCeJbI=;
	b=o3RotQ5qLX5wfFb0ATyJZ4BhnkKMm5QVQb66pANljhaLL+bUZ5VMIkx7/2UxDwLJjc5ROM
	6G2Zh3VP6TxOqZ9N06VSg4VWWf7yidAFIs3yb31jUA1KGbq3uuh4PMQpzMale03PURuT+J
	fi+uSe86w2Mr6GfbtB5cqg66Nkp0+pnFxqWhW83lQ5KuJ3qvgyqNE9fiEu8MdLS1XzZ+Zq
	gYDFIUtscixDKGzbHSvgEGKl+Nsr3tBC52n/8up70BCSj4qaN0CFckCmU1p00bkvENXqye
	Cfnie1QSp7M5Uz0vme7s8afqHYrTW6KeDFDTLF21RKsFNS/a+GU0NEE633z7qQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Zvy+CFyb;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774468066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZ0CsUOUrkvEVaQ4zcstJWXCS82MQpXISNdXEbCeJbI=;
	b=Zvy+CFybwHyxurDbUTrEvuPd0gvF9f9ZKrzgPjU8GEMnm8EKfkvDtINTU4X6k0icRL8UuB
	NWMoc+JZqKzqwcbYBjIZb9BMj7QG3uLmF++bS1/lhfd8wiboL7QEP2ChnVQXu0ihPk9ZKF
	upE1YB2yDfTLvCwv0wwloiWPVWEtafA1s3xISivH2SpihPM+Ad4Um8IKwM9dERj/PYUmR8
	RUbgWFW5mtPDHEo3gA6OiZ0/an5lNILOTJOpSyQ+CyXGzJap50VnFGmPkkDool5JV6v6SS
	jQTWX25dv36Q+ZxZErATgPSIrxPmViBUjVYiS+0dtvB5zqD/0fwEtBYdosyGLA==
To: Jonathan Corbet <corbet@lwn.net>,
	Collin Funk <collin.funk1@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v5 1/2] workflows, scripts: harmonize and cleanup
Date: Wed, 25 Mar 2026 20:46:17 +0100
Message-ID: <20260325194616.78093-2-manuelebner@mailbox.org>
In-Reply-To: <20260325194326.77923-2-manuelebner@mailbox.org>
References: <20260325194326.77923-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: babb8ae0f90d42ba421
X-MBO-RS-META: w47qju4g9t5h9h8cawgur3bh1b7sdpj6
X-Rspamd-Queue-Id: 4fgy9v48jwzB115

cleanup and harmonize output of scripts/ver_linux and table in changes.rst

ver_linux:
fix path to changes.rst
Add missing tools in ver_linux
 bash, bc, bindgen, btrfs-progs, Clang, gdb,  GNU awk, GNU tar,
 GRUB, GRUB2, gtags, iptables, kmod, mcelog, mkimage, openssl,
 pahole, Python, Rust, Sphinx, squashfs-tools

changes.rst:
add reference to ./scripts/ver_linux
needn't -> do not need to
add gdb version 7.2 as mentioned in:
 Documentation/process/debugging/gdb-kernel-debugging.rst
 scripts/gdb/vmlinux-gdb.py

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/process/changes.rst | 14 +++++----
 scripts/ver_linux                 | 49 ++++++++++++++++++++++---------
 2 files changed, 43 insertions(+), 20 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 6b373e193548..d94503341254 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -19,12 +19,13 @@ Current Minimal Requirements
 
 Upgrade to at **least** these software revisions before thinking you've
 encountered a bug!  If you're unsure what version you're currently
-running, the suggested command should tell you.
+running, the suggested command should tell you. For a list of the programs
+on your system including their version execute ./scripts/ver_linux
 
 Again, keep in mind that this list assumes you are already functionally
 running a Linux kernel.  Also, not all tools are necessary on all
 systems; obviously, if you don't have any PC Card hardware, for example,
-you probably needn't concern yourself with pcmciautils.
+you probably do not need to concern yourself with pcmciautils.
 
 ====================== ===============  ========================================
         Program        Minimal version       Command to check the version
@@ -40,7 +41,7 @@ flex                   2.5.35           flex --version
 bison                  2.0              bison --version
 pahole                 1.22             pahole --version
 util-linux             2.10o            mount --version
-kmod                   13               depmod -V
+kmod                   13               kmod -V
 e2fsprogs              1.41.4           e2fsck -V
 jfsutils               1.1.3            fsck.jfs -V
 xfsprogs               2.6.0            xfs_db -V
@@ -51,8 +52,8 @@ quota-tools            3.09             quota -V
 PPP                    2.4.0            pppd --version
 nfs-utils              1.0.5            showmount --version
 procps                 3.2.0            ps --version
-udev                   081              udevd --version
-grub                   0.93             grub --version || grub-install --version
+udev                   081              udevadm --version
+GRUB                   0.93             grub --version || grub-install --version
 mcelog                 0.6              mcelog --version
 iptables               1.4.2            iptables -V
 openssl & libcrypto    1.0.0            openssl version
@@ -62,7 +63,8 @@ GNU tar                1.28             tar --version
 gtags (optional)       6.6.5            gtags --version
 mkimage (optional)     2017.01          mkimage --version
 Python                 3.9.x            python3 --version
-GNU AWK (optional)     5.1.0            gawk --version
+GNU awk (optional)     5.1.0            gawk --version
+gdb                    7.2              gdb --version
 ====================== ===============  ========================================
 
 .. [#f1] Sphinx is needed only to build the Kernel documentation
diff --git a/scripts/ver_linux b/scripts/ver_linux
index d6f2362d3792..fab0c68a6c52 100755
--- a/scripts/ver_linux
+++ b/scripts/ver_linux
@@ -7,7 +7,7 @@
 
 BEGIN {
 	usage = "If some fields are empty or look unusual you may have an old version.\n"
-	usage = usage "Compare to the current minimal requirements in Documentation/Changes.\n"
+	usage = usage "Compare to the current minimal requirements in Documentation/process/changes.rst\n"
 	print usage
 
 	system("uname -a")
@@ -18,22 +18,22 @@ BEGIN {
 	libcpp = "(libg|stdc)[+]+[.]so([.][0-9]+)+$"
 
 	printversion("GNU C", version("gcc -dumpversion"))
-	printversion("GNU Make", version("make --version"))
-	printversion("Binutils", version("ld -v"))
-	printversion("Util-linux", version("mount --version"))
+	printversion("GNU make", version("make --version"))
+	printversion("binutils", version("ld -v"))
+	printversion("util-linux", version("mount --version"))
 	printversion("Mount", version("mount --version"))
 	printversion("Module-init-tools", version("depmod -V"))
-	printversion("E2fsprogs", version("tune2fs"))
-	printversion("Jfsutils", version("fsck.jfs -V"))
-	printversion("Xfsprogs", version("xfs_db -V"))
-	printversion("Pcmciautils", version("pccardctl -V"))
+	printversion("e2fsprogs", version("e2fsck -V"))
+	printversion("jfsutils", version("fsck.jfs -V"))
+	printversion("xfsprogs", version("xfs_db -V"))
+	printversion("pcmciautils", version("pccardctl -V"))
 	printversion("Pcmcia-cs", version("cardmgr -V"))
-	printversion("Quota-tools", version("quota -V"))
+	printversion("quota-tools", version("quota -V"))
 	printversion("PPP", version("pppd --version"))
 	printversion("Isdn4k-utils", version("isdnctrl"))
-	printversion("Nfs-utils", version("showmount --version"))
-	printversion("Bison", version("bison --version"))
-	printversion("Flex", version("flex --version"))
+	printversion("nfs-utils", version("showmount --version"))
+	printversion("bison", version("bison --version"))
+	printversion("flex", version("flex --version"))
 
 	while ("ldconfig -p 2>/dev/null" | getline > 0)
 		if ($NF ~ libc || $NF ~ libcpp)
@@ -41,13 +41,34 @@ BEGIN {
 				printversion("Linux C" ($NF ~ libcpp? "++" : "") " Library", ver)
 
 	printversion("Dynamic linker (ldd)", version("ldd --version"))
-	printversion("Procps", version("ps --version"))
+	printversion("procps", version("ps --version"))
 	printversion("Net-tools", version("ifconfig --version"))
 	printversion("Kbd", version("loadkeys -V"))
 	printversion("Console-tools", version("loadkeys -V"))
 	printversion("Sh-utils", version("expr --v"))
-	printversion("Udev", version("udevadm --version"))
+	printversion("udev", version("udevadm --version"))
 	printversion("Wireless-tools", version("iwconfig --version"))
+	printversion("bash", version("bash --version"))
+	printversion("bc", version("bc --version"))
+	printversion("bindgen", version("bindgen --version"))
+	printversion("btrfs-progs", version("btrfs --version"))
+	printversion("Clang", version("clang --version"))
+	printversion("gdb", version("gdb -version"))
+	printversion("GNU awk", version("gawk --version"))
+	printversion("GNU tar", version("tar --version"))
+	printversion("GRUB", version("grub-install --version"))
+	printversion("GRUB2", version("grub2-install --version"))
+	printversion("gtags", version("gtags --version"))
+	printversion("iptables", version("iptables -V"))
+	printversion("kmod", version("kmod -V"))
+	printversion("mcelog", version("mcelog --version"))
+	printversion("mkimage", version("mkimage --version"))
+	printversion("openssl", version("openssl version"))
+	printversion("pahole", version("pahole --version"))
+	printversion("Python", version("python3 -V"))
+	printversion("Rust", version("rustc --version"))
+	printversion("Sphinx", version("sphinx-build --version"))
+	printversion("squashfs-tools", version("mksquashfs -version"))
 
 	while ("sort /proc/modules" | getline > 0) {
 		mods = mods sep $1
-- 
2.53.0

