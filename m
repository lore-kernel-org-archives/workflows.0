Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8005A1CDFAC;
	Fri, 24 Jan 2025 02:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737684377; cv=none; b=L3bi/GgyOd1FcnsFJZJHo+3Fe/GgC06OylsWWs/5WedaL1WIIMRziXyiy+ROEPN8h8qGxfdIdj2JJuxLbiXkrFwschp61LHxI3UXoOqhWw2ie9vh6e0aTMA6v27FA5mxYuCxKW3Kd2p/uYUbGO2JyiVjR7RfGj8HW+IUawfNzGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737684377; c=relaxed/simple;
	bh=D+rOFtCf6F2uKlmSvp+Sw3ho1m5PhV8oXTOSEetXOnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BBx6PVbz4Ky6djyW/lfxYiKtR4FFy01j9aX746XM15p/j0k9yv8QxFdNEgSwg3sy9Y649MwsenHUnbJJaJ64x7nrE+ung5x+9JpjsuGItKtKdaV8nLe8/5M7P4K2JTF6zL/sUis7gsfHRYVcl826T+j4vm6mMIAlgkucaWNL6vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TJTVxsVK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TJTVxsVK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3BA0C4CEE2;
	Fri, 24 Jan 2025 02:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737684374;
	bh=D+rOFtCf6F2uKlmSvp+Sw3ho1m5PhV8oXTOSEetXOnc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=TJTVxsVKxOX0OVKD9IErL5BOl6enF2Jk2Diy8ZG+55snEV5WSNAo4FcEUvJ/muHjF
	 5YEyOe68E7B3eMHSOUD6jobn5EPOCF4LKMgE+A746ivnJ9WcEOBCMIwi4DeE5xjFTf
	 hJRwhcw2/BKIxGUhCrCcZl2mLtYBuZiNnq5o0MolhWEY6z2XyaYsNtnlQWgBFZ9Hj9
	 cFOKtmJBOiVNk5PSlZsLtkNYrc0wkDZ17QJ9pGvERedAO5OXvENzxgpyz4T4OPAa2k
	 xsj7moKfXKRvEM4H3qvagT/eCmHycP57RS5GeavUUMU7QoFzNXjIMClejtmBvtKcc8
	 v4pN2WrR4D6PA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF96CC0218B;
	Fri, 24 Jan 2025 02:06:14 +0000 (UTC)
From: Christoph Lameter via B4 Relay <devnull+cl.gentwo.org@kernel.org>
Date: Thu, 23 Jan 2025 18:06:03 -0800
Subject: [PATCH v2] KFENCE: Clarify that sample allocations are not
 following NUMA or memory policies
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-kfence_doc_update-v2-1-e80efaccc0d4@gentwo.org>
X-B4-Tracking: v=1; b=H4sIAIr1kmcC/32NWw7CIBQFt9LcbzEFilq/3IdpGh63LTGBBhA1D
 XsXuwA/Z5IzZ4OIwWKEa7NBwGyj9a4COzSgF+lmJNZUBtYy0VLGyWNCp3E0Xo/P1ciEpOeqE+e
 TZkIpqLs14GTfe/M+VF5sTD589otMf/ZfLVNCSS/lBftOcdOq24wuvfzRhxmGUsoXICi/3LMAA
 AA=
To: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Huang Shijie <shijie@os.amperecomputing.com>
Cc: kasan-dev@googlegroups.com, workflows@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christoph Lameter <cl@linux.com>, Yang Shi <shy828301@gmail.com>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737684374; l=3059;
 i=cl@gentwo.org; s=20240811; h=from:subject:message-id;
 bh=jDYv6E/8e4wLrb6Ka2L1+EFb9x3w209Y8Bg1u/WHFNA=;
 b=yMoEJnAtIT+qS06EPP9LFWpWtyNaFT6VEzwG4PNqco5oq+djKibhEN80aJush6LDzKaxqmtgS
 Cc0dfy9T3AUAejAwBCeW4rg9fU1G9GwNyEBDxbAY4KggbtWllOlnnOZ
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
Reviewed-by: Yang Shi <shy828301@gmail.com>
---
Changes in v2:
- Remove dependency on CONFIG_DEBUG_VM.
- Spelling fixes.
- Link to v1: https://lore.kernel.org/r/20250123-kfence_doc_update-v1-1-9aa8e94b3d0b@gentwo.org
---
 Documentation/dev-tools/kfence.rst | 4 +++-
 lib/Kconfig.kfence                 | 8 +++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/dev-tools/kfence.rst b/Documentation/dev-tools/kfence.rst
index 541899353865..03062d0941dc 100644
--- a/Documentation/dev-tools/kfence.rst
+++ b/Documentation/dev-tools/kfence.rst
@@ -8,7 +8,9 @@ Kernel Electric-Fence (KFENCE) is a low-overhead sampling-based memory safety
 error detector. KFENCE detects heap out-of-bounds access, use-after-free, and
 invalid-free errors.
 
-KFENCE is designed to be enabled in production kernels, and has near zero
+KFENCE is designed to be low overhead but does not implement the typical
+memory allocation features for its samples like memory policies, NUMA and
+management of emergency memory pools. It has near zero
 performance overhead. Compared to KASAN, KFENCE trades performance for
 precision. The main motivation behind KFENCE's design, is that with enough
 total uptime KFENCE will detect bugs in code paths not typically exercised by
diff --git a/lib/Kconfig.kfence b/lib/Kconfig.kfence
index 6fbbebec683a..1f9f79df2d0a 100644
--- a/lib/Kconfig.kfence
+++ b/lib/Kconfig.kfence
@@ -11,8 +11,8 @@ menuconfig KFENCE
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


