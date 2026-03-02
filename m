Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C61B30499A;
	Mon,  2 Mar 2026 18:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772476046; cv=none; b=MrLY7QebeL/XyXu2aBKLfZMdKqVGmzXTsVm3LwGAj482oUklQEqc3hBwM1XDCkygnHhhwCPQnakQlx1SRSBonBXAMNLPsn1L0fWwi33mgDpubT9aPuBQo+Ywm5Zgp/cNan9GrfvhB2tLenodv33CL8rd6pFYlrrUsbKRS1aGNDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772476046; c=relaxed/simple;
	bh=IUrib7DNdywGKcEMO1D/SXe1yLasGi+DhvXteZsGrZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=izRS4jS+gm6R/TntoC3v2tpIgx1ZEDXO59iOcXrOFgXUlG9yqDbbgpK7QweztFQEJLqmPKQb5qcSwTaNEvefuvPjla5pMkn7TmAH6rVVc1avlLWYoeImfGw6hAi+ip6XaDRX8QT1SycyFsPkE9K24o4xI1CVKRHUJNTXjzmeANk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc; spf=pass smtp.mailfrom=airmail.cc; dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b=BrJ+jOFR; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airmail.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b="BrJ+jOFR"
From: Manuel Ebner <manuelebner@airmail.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
	t=1772476039; bh=IUrib7DNdywGKcEMO1D/SXe1yLasGi+DhvXteZsGrZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BrJ+jOFRDJ7j7AJvqZEzd+amo0I3QCM5z0GdzVhNUGJpAE3UD4XxGZdLQD89VPq2t
	 EolU0IVUVNUXxm3dIJvIXR8saHzgPhZZZc+QCZKIZ1zCKmCExxzgoFSWN32tiy0JFq
	 HQoT6wL0N1H3qTK7BaxtVAkHrPr4bvK0Ht3b1FaiIWHa1rl6Ub8jtrmYpkWpGbWSS1
	 iXT6Nt2M6sScB3domZUOKeQ/Zz/IjSfC1qWQIkIRR0iKW/b2SyiBY/AIdZ5/J5pJ+9
	 m7VQUu2X2GrwKMlregcvHuDjwx5+qwg7CXAe+zmo93n0OQ2nvNIMqxqnvWz1BhwwbR
	 jtjsuGo2imMoA==
To: Jonathan Corbet <corbet@lwn.net>,
	Collin Funk <collin.funk1@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manuel Ebner <manuelebner@airmail.cc>
Subject: [PATCH v3 1/2] workflow: process/changes.rst: sort and cleanup list
Date: Mon,  2 Mar 2026 19:26:31 +0100
Message-ID: <20260302182629.87194-3-manuelebner@airmail.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302182405.86829-2-manuelebner@airmail.cc>
References: <20260302182405.86829-2-manuelebner@airmail.cc>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is a pain in the ass to compare the software versions on the running
system with the minimal required versions (process/changes.rst).
Sorting both lists the same way makes side-by-side comparisons a simple task.

add gdb version 7.2 as mentioned in:
 Documentation/process/debugging/gdb-kernel-debugging.rst
 scripts/gdb/vmlinux-gdb.py

sort table of required software versions alphabetically
add reference to scripts/ver_linux
needn't -> do not need to

Signed-off-by: Manuel Ebner <manuelebner@airmail.cc>
---
 Documentation/process/changes.rst | 54 ++++++++++++++++---------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 6b373e193548..41c97163e67e 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -24,45 +24,47 @@ running, the suggested command should tell you.
 Again, keep in mind that this list assumes you are already functionally
 running a Linux kernel.  Also, not all tools are necessary on all
 systems; obviously, if you don't have any PC Card hardware, for example,
-you probably needn't concern yourself with pcmciautils.
+you probably do not need to concern yourself with pcmciautils. For a list of the
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
+gdb                    7.2              gdb --version
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

