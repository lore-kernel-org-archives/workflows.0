Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FF93A1CE3;
	Thu, 26 Feb 2026 10:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100751; cv=none; b=MfWVlEw3FN2EyCM+u2JxyS8b7wIF98Emho/J0pJ4ji/AbUfEL4vEGlXscMtQ+WQ3V6RhZ0cWFpXAyPqKcQQ9mSukx7QFh5+IXcaUKqTySWOyI51JYPhGBnIQxjsROYbz4LLQolHvDyCh8q3YNp+JUpKbtjfLOlN7A+pbznIlqsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100751; c=relaxed/simple;
	bh=SPdnSWWhSwNp6lO8V2xKAuZPAktOOun9WanZfguIejs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cbrk4qm0F4Ts+JepZO1hPanP/9f9ejH5WixE3kpYYuEeDVgwv3FpU2c4LFLlgxyiJuAK87MwzpolPbgWBkF4T9WwdGq07Wil5/ioMhJ9CXLndABCtTkiJZ43PhllNKUCSAXcnBF4+ipFFKMoa9Ijo6Ry6WZnRIWFnE7uWdugycc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc; spf=pass smtp.mailfrom=airmail.cc; dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b=ig79xI4k; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airmail.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b="ig79xI4k"
From: Hans Anda <hansa@airmail.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
	t=1772100746; bh=SPdnSWWhSwNp6lO8V2xKAuZPAktOOun9WanZfguIejs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ig79xI4kFzKFKrQaMKdkrCL9JzWUj2xct1DJOqUM8dC9t8TG2CGKZUR8S+Z5ZSN4Y
	 5cT0/j2i3O0BmXzQBDN65/DoChhEIrFqbaeRXXT9lbSUTjZ75RLqa9kAlRBwQGCUXg
	 Xxq77YhIyEnwTDzNH8HEzL65YBN/mDXWSG2OrR72kXBFbJ+hp8n7/WU1jH3gkbBBHi
	 sq3PyfL8/QOhosA4OjMCctgQyBalwFLhJ+j2kkcGci2fJ+a/A0Z21aDycs3Axf0D2P
	 GuUIHl2WAXkE/2xsQ8wwz2LY1Y+7TExTQ1ZA+9UCJjMQwai2xPLR5ld9q35GSFE8V5
	 WCRfKfTOtL5hA==
To: Jonathan Corbet <corbet@lwn.net>,
	Collin Funk <collin.funk1@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Anda <hansa@airmail.cc>
Subject: [PATCH v2 1/2] workflow: process/changes.rst: sort list
Date: Thu, 26 Feb 2026 11:11:43 +0100
Message-ID: <20260226101142.41515-2-hansa@airmail.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226100256.40215-2-hansa@airmail.cc>
References: <20260226100256.40215-2-hansa@airmail.cc>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sort table of required software versions alphabetically
add reference to scripts/ver_linux

Signed-off-by: Hans Anda <hansa@airmail.cc>
---
 Documentation/process/changes.rst | 53 ++++++++++++++++---------------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 6b373e193548..f27572d415a5 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -24,45 +24,46 @@ running, the suggested command should tell you.
 Again, keep in mind that this list assumes you are already functionally
 running a Linux kernel.  Also, not all tools are necessary on all
 systems; obviously, if you don't have any PC Card hardware, for example,
-you probably needn't concern yourself with pcmciautils.
+you probably needn't concern yourself with pcmciautils. For a list of the
+programs on your system including their version execute ./scripts/ver_linux
 
 ====================== ===============  ========================================
         Program        Minimal version       Command to check the version
 ====================== ===============  ========================================
-GNU C                  8.1              gcc --version
-Clang/LLVM (optional)  15.0.0           clang --version
-Rust (optional)        1.78.0           rustc --version
-bindgen (optional)     0.65.1           bindgen --version
-GNU make               4.0              make --version
 bash                   4.2              bash --version
+bc                     1.06.95          bc --version
+bindgen (optional)     0.65.1           bindgen --version
 binutils               2.30             ld -v
-flex                   2.5.35           flex --version
 bison                  2.0              bison --version
-pahole                 1.22             pahole --version
-util-linux             2.10o            mount --version
-kmod                   13               depmod -V
+btrfs-progs            0.18             btrfs --version
+Clang/LLVM (optional)  15.0.0           clang --version
 e2fsprogs              1.41.4           e2fsck -V
+flex                   2.5.35           flex --version
+GNU AWK (optional)     5.1.0            gawk --version
+GNU C                  8.1              gcc --version
+GNU make               4.0              make --version
+GNU tar                1.28             tar --version
+grub                   0.93             grub --version || grub-install --version
+gtags (optional)       6.6.5            gtags --version
+iptables               1.4.2            iptables -V
 jfsutils               1.1.3            fsck.jfs -V
-xfsprogs               2.6.0            xfs_db -V
-squashfs-tools         4.0              mksquashfs -version
-btrfs-progs            0.18             btrfs --version
+kmod                   13               depmod -V
+mcelog                 0.6              mcelog --version
+mkimage (optional)     2017.01          mkimage --version
+nfs-utils              1.0.5            showmount --version
+openssl & libcrypto    1.0.0            openssl version
+pahole                 1.22             pahole --version
 pcmciautils            004              pccardctl -V
-quota-tools            3.09             quota -V
 PPP                    2.4.0            pppd --version
-nfs-utils              1.0.5            showmount --version
 procps                 3.2.0            ps --version
-udev                   081              udevd --version
-grub                   0.93             grub --version || grub-install --version
-mcelog                 0.6              mcelog --version
-iptables               1.4.2            iptables -V
-openssl & libcrypto    1.0.0            openssl version
-bc                     1.06.95          bc --version
-Sphinx\ [#f1]_         3.4.3            sphinx-build --version
-GNU tar                1.28             tar --version
-gtags (optional)       6.6.5            gtags --version
-mkimage (optional)     2017.01          mkimage --version
 Python                 3.9.x            python3 --version
-GNU AWK (optional)     5.1.0            gawk --version
+quota-tools            3.09             quota -V
+Rust (optional)        1.78.0           rustc --version
+Sphinx\ [#f1]_         3.4.3            sphinx-build --version
+squashfs-tools         4.0              mksquashfs -version
+udev                   081              udevadm --version
+util-linux             2.10o            mount --version
+xfsprogs               2.6.0            xfs_db -V
 ====================== ===============  ========================================
 
 .. [#f1] Sphinx is needed only to build the Kernel documentation
-- 
2.53.0

