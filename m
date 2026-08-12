Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFEB434E4F;
	Wed, 12 Aug 2026 12:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786537356; cv=none; b=k5RixCD7EU8sBN+tn2MHqyQMFAqGf3QMfsP8huGLah1EA22tnSTEH2Se0B/aft/8duaIB5bC1isfRbV1DkgzwS5DydXh08p14pn5j+w7gzqUQUAWaSiH0jWRtWKXemRIngAt41M4+8yarAVh1Z1zn3ERwHOf7nJJ4nYvAU/1Fgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786537356; c=relaxed/simple;
	bh=IhRmaWGzKtc9ernRfq4U6vFdWbBfVYZsTYt0JJ2RfjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NpcNcmazfWVhV3DEVoHemeZR8RdnMIiJUnOgZ6O/3EP16+W/bHsIUHazXzoGcUEspaO0JextV9Xvh00y3k6hzCZivJUPpK/AI7LUmQdCfZf05hTJbXf3hV70AKiGNFLgdHScaJNLgLs2wxNGLkYw40D8VZfTwIM27LIQ9aGKjNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=PAnDsi80; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cNn3Apgl; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PAnDsi80";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cNn3Apgl"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hKngR0Thgz8v0B;
	Wed, 12 Aug 2026 14:22:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786537347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=03d9q7/t0p4KkJvLoCOhFte/KZ3gqvofZ21h8oY4yfg=;
	b=PAnDsi80NVZVHAlLxPXTigGgoWMV6VKSLuPqiEG6ANytu8L79Lv4o/esTP00qLSvqSvnY/
	UL9EbhQvtlUXcb2OhuudO5MUuYII6iloZ2YhJqQSK48ezK506NZ1GDreaFa2Y/mjxaKQab
	iu9bPdPcQcQBLj4v21rk/Fd7RVEUDQR8H/iPW8Crx482/1A1Gq/M5Pv8JPicP2o7R/aCgN
	m8Cp9d3KLB/BeeiOSi0koDa1/sDgIFgmGuTkFEsslU4HbyqNsi0HsQrSDi9VxA9shxSQVi
	uSxF/HbaI/azThntPNBRfxhZrE3jxdK20FB2WSqj5n5GcENzNTVZu90IrXjiPg==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786537345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=03d9q7/t0p4KkJvLoCOhFte/KZ3gqvofZ21h8oY4yfg=;
	b=cNn3ApglQfAddK7BqMeES9jIMr3TJ0mLA03hPyZmyIP5Tv4Y3hcPEJD2qZPUU+PSjjIWsh
	aAMZVWGM57kkPHXW4m7ArOt+rqhktmHRdUDk5TxegKxdXguqba/5PSbsQTZbPM2+VTadpT
	CXbnWwKUvx7XUAgf52EduXOWCPsuzrzyf44QlkV8vfc1Hs5Fi7gI8PW4r5B/u+qxUkp3hB
	bcVygGsTtKwk3ugEoomd76/MatbN8uwsiKRMBPDq/LtevMSS4mTs1JRXljd4QCfiIbpoj6
	hdjeX7GH32F8I3odRwzDHq8CTfcS9K1e4qIJFK+ltARMWavj6QTJqQkMSumN4g==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] Docs: software-requirements.rst: add lzop, lzma and ip-route2
Date: Wed, 12 Aug 2026 14:21:44 +0200
Message-ID: <20260812122149.1635408-2-manuelebnerli@mailbox.org>
In-Reply-To: <20260812120805.1631430-3-manuelebnerli@mailbox.org>
References: <20260812120805.1631430-3-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 10380a556462d48c39c
X-MBO-RS-META: rxcnyupzcdyjyqq7fs35qmamugzxrbc4

lzma is required with HAVE_KERNEL_LZMA set to y
lzop is required with CRYPTO_LZO set to y
ip-route2 is mentioned in software-requirements below.

add tools to
 software-requirements.rst
 ver_linux

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/process/software-requirements.rst | 4 ++++
 scripts/ver_linux                               | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/process/software-requirements.rst b/Documentation/process/software-requirements.rst
index 69d31a3b5be3..5fdfcf6a0c01 100644
--- a/Documentation/process/software-requirements.rst
+++ b/Documentation/process/software-requirements.rst
@@ -47,9 +47,12 @@ GNU make               4.0              make --version
 GNU tar                1.28             tar --version
 GRUB                   0.93             grub --version || grub-install --version
 gtags (optional)       6.6.5            gtags --version
+ip-route2              6.14.0           ip -V
 iptables               1.4.2            iptables -V
 jfsutils               1.1.3            fsck.jfs -V
 kmod                   13               kmod -V
+liblzma                5.8.1            lzma -V
+lzop                   1.04             lzop -V
 mcelog                 0.6              mcelog --version
 mkimage (optional)     2017.01          mkimage --version
 nfs-utils              1.0.5            showmount --version
@@ -66,6 +69,7 @@ squashfs-tools         4.0              mksquashfs -version
 udev                   081              udevadm --version
 util-linux             2.10o            mount --version
 xfsprogs               2.6.0            xfs_db -V
+xz                     5.8.1            xz -V
 ====================== ===============  ========================================
 
 .. [#f1] Sphinx is needed only to build the Kernel documentation
diff --git a/scripts/ver_linux b/scripts/ver_linux
index 1d860c8a37f3..5e99a5699f1a 100755
--- a/scripts/ver_linux
+++ b/scripts/ver_linux
@@ -37,16 +37,19 @@ BEGIN {
 	printversion("GRUB", version("grub-install --version"))
 	printversion("gtags", version("gtags --version"))
 	printversion("iptables", version("iptables -V"))
+	printversion("ip-route2", version("ip -V"))
 	printversion("Isdn4k-utils", version("isdnctrl"))
 	printversion("jfsutils", version("fsck.jfs -V"))
 	printversion("Kbd", version("loadkeys -V"))
 	printversion("kmod", version("kmod -V"))
+	printversion("liblzma", version("lzma -V"))
 
 	while ("ldconfig -p 2>/dev/null" | getline > 0)
 		if ($NF ~ libc || $NF ~ libcpp)
 			if (!seen[ver = version("readlink " $NF)]++)
 				printversion("Linux C" ($NF ~ libcpp? "++" : "") " Library", ver)
 
+	printversion("lzop", version("lzop --version"))
 	printversion("mcelog", version("mcelog --version"))
 	printversion("mkimage", version("mkimage --version"))
 	printversion("Module-init-tools", version("depmod -V"))
@@ -69,6 +72,7 @@ BEGIN {
 	printversion("util-linux", version("mount --version"))
 	printversion("Wireless-tools", version("iwconfig --version"))
 	printversion("xfsprogs", version("xfs_db -V"))
+	printversion("xz", version("xz -V"))
 
 	while ("sort /proc/modules" | getline > 0) {
 		mods = mods sep $1
-- 
2.54.0

