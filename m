Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89257343D86;
	Fri, 12 Jun 2026 04:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781239497; cv=none; b=bcN4kP9CWjY7zYq6yGtbwtIEpNR39CTH+6171M/B1x5CDqGRorISVH1xFlGigakW/lm1SDRcF8ghKty2xVftlIelM18KkUXOX4rA8zhUK8ZeHhT37HPufH46dVykyohtC4Noosrj3ilvRAPN6GDRkdCB5yfjl2V6ik1ARmbqKsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781239497; c=relaxed/simple;
	bh=SQA3Q3+/82oh45oJTME91UR/PdPgdrsuA9Fdpn4kolY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TEtGFDt1JWh3m7RoTnYBy3lIKFfKwkxdDcx20SVdpf2995aQN6SItiQ8GU+oAoB2pKay6JsOFBtuCcIyavR+ppH4+KTiiCa4uzCWsOLmxCK9QTo/k3qWC1Q6iPGIb80/Jz4BsDgHTp0o+3+fSqNqySANoldZxNF9BJHVuVEQUpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=C5jJ/wIW; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="C5jJ/wIW"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3C722E91;
	Thu, 11 Jun 2026 21:44:48 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E073D3FAF5;
	Thu, 11 Jun 2026 21:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781239493; bh=SQA3Q3+/82oh45oJTME91UR/PdPgdrsuA9Fdpn4kolY=;
	h=From:To:Cc:Subject:Date:From;
	b=C5jJ/wIWZzhIUGdGO9T1hGV6rroAbSN3pDV9MfJilf8tLHrAckiL0S/LKO41BXhZH
	 TcYl95kWuiBGL2H9XMsb2TGyjHPdch3DNT1yTG9y+K52Dm55IzVzSy+Ru4qjMsWBbB
	 MevnQMAJu19h7w8r6XSGIR3dzkoJ3W1yPt0WeTnE=
From: Dev Jain <dev.jain@arm.com>
To: ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org,
	corbet@lwn.net
Cc: Dev Jain <dev.jain@arm.com>,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	kaleshsingh@google.com,
	21cnbao@gmail.com,
	david@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com
Subject: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at allocation time
Date: Fri, 12 Jun 2026 04:44:22 +0000
Message-ID: <20260612044425.763060-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a boot option to tag only at allocation time of the objects. This
reduces KASAN MTE overhead, the tradeoff being reduced ability of
catching bugs.

Now, when a memory object will be freed, it will retain the random tag it
had at allocation time. This compromises on catching UAF bugs, till the
time the object is not reallocated, at which point it will have a new
random tag.

Hence, not catching "use-after-free-before-reallocation" and not catching
"double-free" will be the compromise for reduced KASAN overhead.

This is an RFC because we are not clear about the performance benefit.

Android folks, please help with testing!

---
Applies on Linus master (9716c086c8e8).

Dev Jain (2):
  kasan: hw_tags: Use KASAN_PAGE_REDZONE for vmalloc redzoning
  kasan: hw_tags: Add boot option to elide free time poisoning

 Documentation/dev-tools/kasan.rst |  4 +++
 mm/kasan/hw_tags.c                | 45 +++++++++++++++++++++++++++++--
 mm/kasan/kasan.h                  | 23 +++++++++++++++-
 3 files changed, 69 insertions(+), 3 deletions(-)

-- 
2.43.0

