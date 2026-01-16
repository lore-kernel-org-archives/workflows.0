Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B18F346E67;
	Fri, 16 Jan 2026 05:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768539946; cv=none; b=gxk74j7ahxSliFv5eHNHAESQQfloUp1vJldQfahl2yvX9IKD+FFPE1ROBXS0IkGfUQMO0CZoVpltXt33uLbcmWVDMznDCVPRXLGMK/r/0wZ/emfrTKM+6GsLwkQv/M81rf0wVy31KoAOv4StllZPKPxvn2hZcjj0BVTcJG7vUkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768539946; c=relaxed/simple;
	bh=qTN4ZmJAcY/7Mqt9L6P1f7dQ73n9JWnRjJJIRNS6el4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xsmv1wB1Pa+bTrX4T4NOtGV0Qsuytg5Bw8AkNn/QHjd3v0xyrS1nwKxSaTXN1ncCXk1wSh3LXVvobLzK/tVaEBGCFeNOZarjmOQrGDBVB9q1lCappe3sPhxyLpNnmw/fzlK5BS3KHGB6APZ/AlpkYOMEUL0uhAfyy80fG7apLRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=i5988vb7; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="i5988vb7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=QR
	rMWkxr4YS+hiKCtK4HH8fu/WuUoIFVfDTeegnOizY=; b=i5988vb7boddN9D7hO
	xxWwc2FRqNRdjKeIO/ZwMDopGMiFzsS9I0qq5lVkB5RyWGODitTxHLWwTfwUlUWL
	1m+Ip5ohQYbEN92k6f0+RTTJZhZ8zP4G0JfT+uPt0ICdSZppwInYx7NaghDckZ2j
	dyPRUz5xbGSqu5ip8dnvRCoak=
Received: from X13.domain.sensetime.com (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wAHVEAGx2lpg3aLFw--.24069S2;
	Fri, 16 Jan 2026 13:05:11 +0800 (CST)
From: junan <junan76@163.com>
To: jason.wessel@windriver.com,
	danielt@kernel.org,
	dianders@chromium.org,
	corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	junan <junan76@163.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH] doc: kgdb: Add description about rodata=off kernel parameter
Date: Fri, 16 Jan 2026 13:03:13 +0800
Message-ID: <20260116050410.772340-2-junan76@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAHVEAGx2lpg3aLFw--.24069S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF4kuF1rXr1DKFWxGryfJFb_yoWDtFXEva
	48GF4j9ryUtFyxKr4UJr4ruFya9ayjkF18trn7XrW3ArWavw13XFWDJFWDWr1rXFZF9rW3
	Za98ZryktF13tjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRRAR6UUUUUU==
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/xtbC9genWWlpxwd4FgAA3h

STRICT_KERNEL_RWX can not be turned off throught menuconfig on some
architectures, pass "rodata=off" to the kernel in this case.

Tested with qemu on arm64.

Signed-off-by: junan <junan76@163.com>
Suggested-by: Will Deacon <will@kernel.org>
---
 Documentation/process/debugging/kgdb.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/process/debugging/kgdb.rst b/Documentation/process/debugging/kgdb.rst
index b29b0aac2717..f2c57de7992f 100644
--- a/Documentation/process/debugging/kgdb.rst
+++ b/Documentation/process/debugging/kgdb.rst
@@ -380,6 +380,13 @@ virtual address where the kernel image is mapped and confuses
 gdb which resolves addresses of kernel symbols from the symbol table
 of vmlinux.
 
+Kernel parameter: ``rodata``
+----------------------------
+
+``CONFIG_STRICT_KERNEL_RWX`` is turned on by default and is not
+visible to menuconfig on some architectures (arm64 for example),
+you can pass ``rodata=off`` to the kernel in this case.
+
 Using kdb
 =========
 
-- 
2.43.0

