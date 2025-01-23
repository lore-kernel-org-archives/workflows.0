Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7D13C463;
	Thu, 23 Jan 2025 22:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737672280; cv=none; b=NdbCXvft/JBjyuNZQg46GOQse2jiOKmQhqviq8cHfXzRb63+5aSeKqSxCIaVHqqU5FvkJV9g3vsuafbvLL7P5S+HF0U3FToqm4fxvfzpYY/bsSu1EokgA1+42z9sH4xyzIXJzLtdR7KPZJq7UNLtdlCUDEzxXgrJXDVb9gTomVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737672280; c=relaxed/simple;
	bh=00q08OgSaOaKeNWcotKnSlTpifKZRRRFN73bDlf+iX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rCJaXFF+9E7lIY5osPswFFfrGcBU/K6ibpKs6Owj1BnScVj9cI34ZFUXX5wnvSCaEwu7tHIkpnyx9SQHIgXXQjCl9dhKxk4kGQhQmQg4CSdKnERTqltd6PnQ0gXTWAbdtDOEEwS7WXhr4/4c+Les+lQTtZMEEv4HxqaA8LPBvKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVysbSma; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVysbSma"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BE82C4CED3;
	Thu, 23 Jan 2025 22:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737672280;
	bh=00q08OgSaOaKeNWcotKnSlTpifKZRRRFN73bDlf+iX0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=JVysbSma7w0N96yfWCXqwal7a7xsj+1LcyVHhwhAJU47AwSQNzzAQq92B7k0VuzpW
	 FgXqGsFbWW/iRoFiPkziWlFq6BAv7OsAKU2sHaThDBccTQ0zRNqUnimGQ8pCrfmyjG
	 2eWetapfsoJ+V7XM7jcLcW7tLRc0CCf+h16RF+OD0GZgf3II1ObBHVfh6qwdiFl7vA
	 3HYv4u25DGDMT0Px6A/jB8lI6wp/P/lIn4OPwtpry2o55ctqaPtR9J14AQdUnvBTDI
	 DumtJRMTiloPjqqvS5g5IzjOBEfn5fFUengrqS1aOtgSjUfh4YI9PE7Z0fVwGi8KY/
	 qq0dgjTnqESpA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F87C02182;
	Thu, 23 Jan 2025 22:44:40 +0000 (UTC)
From: Christoph Lameter via B4 Relay <devnull+cl.gentwo.org@kernel.org>
Date: Thu, 23 Jan 2025 14:44:22 -0800
Subject: [PATCH] KFENCE: Clarify that sample allocations are not following
 NUMA or memory policies
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-kfence_doc_update-v1-1-9aa8e94b3d0b@gentwo.org>
X-B4-Tracking: v=1; b=H4sIAEXGkmcC/x3MQQqAIBBA0avIrBNKs6irREjqVEOgoRVBdPek5
 Vv8/0DCSJigZw9EvChR8BlVwcCuk1+Qk8sGUQpVVkLybUZvUbtg9bm76UDeSVOrtrFCGQO52yP
 OdP/PYXzfD8JKsIVjAAAA
To: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Yang Shi <shy828301@gmail.com>, 
 Huang Shijie <shijie@os.amperecomputing.com>
Cc: kasan-dev@googlegroups.com, workflows@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christoph Lameter <cl@linux.com>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737672279; l=3054;
 i=cl@gentwo.org; s=20240811; h=from:subject:message-id;
 bh=eIxS3YCsT4+4g6upmIgCuuU4kgmE4EN1FGtWLpy+DEk=;
 b=byG2v1ccXcVddMP4S2pWoNTqusVg0lM7PldpPyYmxe+NZFCRj2oqkKiZZAv6hjBhftZDnio93
 yi+D93q9QRVB0LvrZiXBylDWb052rPSMv87mqekQxhCVEDNQicsg/VF
X-Developer-Key: i=cl@gentwo.org; a=ed25519;
 pk=I7gqGwDi9drzCReFIuf2k9de1FI1BGibsshXI0DIvq8=
X-Endpoint-Received: by B4 Relay for cl@gentwo.org/20240811 with
 auth_id=194
X-Original-From: Christoph Lameter <cl@gentwo.org>
Reply-To: cl@gentwo.org

From: Christoph Lameter <cl@linux.com>

KFENCE manages its own pools and redirects regular memory allocations
to those pools in a sporadic way. The usual memory allocator features
like NUMA, memory policies and pfmemalloc are not supported.
This means that one gets surprising object placement with KFENCE that
may impact performance on some NUMA systems.

Update the description and make KFENCE depend on VM debugging
having been enabled.

Signed-off-by: Christoph Lameter <cl@linux.com>
---
 Documentation/dev-tools/kfence.rst |  4 +++-
 lib/Kconfig.kfence                 | 10 ++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/dev-tools/kfence.rst b/Documentation/dev-tools/kfence.rst
index 541899353865..27150780d6f5 100644
--- a/Documentation/dev-tools/kfence.rst
+++ b/Documentation/dev-tools/kfence.rst
@@ -8,7 +8,9 @@ Kernel Electric-Fence (KFENCE) is a low-overhead sampling-based memory safety
 error detector. KFENCE detects heap out-of-bounds access, use-after-free, and
 invalid-free errors.
 
-KFENCE is designed to be enabled in production kernels, and has near zero
+KFENCE is designed to be low overhead but does not implememnt the typical
+memory allocation features for its samples like memory policies, NUMA and
+management of emergency memory pools. It has near zero
 performance overhead. Compared to KASAN, KFENCE trades performance for
 precision. The main motivation behind KFENCE's design, is that with enough
 total uptime KFENCE will detect bugs in code paths not typically exercised by
diff --git a/lib/Kconfig.kfence b/lib/Kconfig.kfence
index 6fbbebec683a..48d2a6a1be08 100644
--- a/lib/Kconfig.kfence
+++ b/lib/Kconfig.kfence
@@ -5,14 +5,14 @@ config HAVE_ARCH_KFENCE
 
 menuconfig KFENCE
 	bool "KFENCE: low-overhead sampling-based memory safety error detector"
-	depends on HAVE_ARCH_KFENCE
+	depends on HAVE_ARCH_KFENCE && DEBUG_VM
 	select STACKTRACE
 	select IRQ_WORK
 	help
 	  KFENCE is a low-overhead sampling-based detector of heap out-of-bounds
 	  access, use-after-free, and invalid-free errors. KFENCE is designed
-	  to have negligible cost to permit enabling it in production
-	  environments.
+	  to have negligible cost. KFENCE does not support NUMA features
+	  and other memory allocator features for it sample allocations.
 
 	  See <file:Documentation/dev-tools/kfence.rst> for more details.
 
@@ -21,7 +21,9 @@ menuconfig KFENCE
 	  detect, albeit at very different performance profiles. If you can
 	  afford to use KASAN, continue using KASAN, for example in test
 	  environments. If your kernel targets production use, and cannot
-	  enable KASAN due to its cost, consider using KFENCE.
+	  enable KASAN due to its cost and you are not using NUMA and have
+	  no use of the memory reserve logic of the memory allocators,
+	  consider using KFENCE.
 
 if KFENCE
 

---
base-commit: d0d106a2bd21499901299160744e5fe9f4c83ddb
change-id: 20250123-kfence_doc_update-93b4576c25bb

Best regards,
-- 
Christoph Lameter <cl@gentwo.org>


