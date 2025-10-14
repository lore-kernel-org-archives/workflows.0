Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAB52D322E
	for <workflows@vger.kernel.org>; Tue, 14 Oct 2025 07:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426130; cv=none; b=TKIpOuJ73QNoy9NgbBzwhTPoMwFcUlKuDAEjoKoWdvnAMJMWKFD08E8+4EQjlapIafz8GlCTAyC6LOHZw9sFcnppMN7Q/0Khha2uRMunOL/J/zld/JyBc1ZNYNkPC2yuvCEpSnkYqRoJmu3ttMmaP3DdjElam4Hg249B9yxW0mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426130; c=relaxed/simple;
	bh=oLBYbQG6Oasw9t4LIeAnssx7OENPrHvlmSKfAxxJRcc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oeacPEOQfxFgCRVBxlt6JKKTjHo1Wnr/Vj8viPO23PPn0mNSs27TtWLfxI+MPP5BTAx2lKRVhXr643VW0toUcLXW43kPdv8oa4Q1ivEEMJ0kdkeDekpgvcAG7sbL3LYyC77Xn5KsrDBjt1u42Ag2v4R89FVbKRHxGSz/LGXGiCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gUtXBFtq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gUtXBFtq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760426129; x=1791962129;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oLBYbQG6Oasw9t4LIeAnssx7OENPrHvlmSKfAxxJRcc=;
  b=gUtXBFtqylW5qusaSBY0i31RWFVXgBTH8tX9jLN1r5Qv93qXPyFLQ+ZN
   2hRQaj/zgb7xYtrTgkigvZCc0FVHgkXRt+qw183NL6BxO1xL+sN6unxdH
   A3/uGzx88VOm7Z6guenj3IW0H8qc/7Z1CSNyVEnBiWPw9znyFj+gaCfv6
   ubX4xgFRIpsXr02oCK4EQGrPfyBi2uubuCEBCLUgR18oqElgc/E7G6Tnu
   wT+udcQDdK3jgNpXZDhrs73ALYYs+/V/H6oikaxMAgMnh+PieTdFGx+T+
   BUo0wDOihwbrzuclD+ZnFsv5kKcLkwcRGlxxQ35St4Iv8MIeF4FHwQd7M
   A==;
X-CSE-ConnectionGUID: HHnSylIIQ0+txWkr5fsjrw==
X-CSE-MsgGUID: UQz+ZCcYShmR2Bfd3o1SkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66233794"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="66233794"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:15:28 -0700
X-CSE-ConnectionGUID: +B7sSUX6SE6X5eErvkLVtQ==
X-CSE-MsgGUID: aHJLFucjQpSI2ytE3lQoDw==
X-ExtLoop1: 1
Received: from dwillia2-desk.jf.intel.com ([10.88.27.145])
  by fmviesa003.fm.intel.com with ESMTP; 14 Oct 2025 00:15:28 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: konstantin@linuxfoundation.org
Cc: ksummit@lists.linux.dev,
	workflows@vger.kernel.org
Subject: [PATCH 0/3] b4: Add git notes for submission link trailers
Date: Tue, 14 Oct 2025 00:15:27 -0700
Message-ID: <20251014071530.3665691-1-dan.j.williams@intel.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As detailed in patch3, after the fact / dynamic lore link generation
continues to be awkward for managing work-in-progress patches across
multiple versions. 'git notes' allows for workflow specific metadata
that does not pollute upstream. The other desirable feature of notes is
that they are displayed by default in cgit.

So the mainline history and upstream pull-requests remain clean, but
work-in-progress series development can readily display which commits
came from which messages.

Example:
$ b4 shazam -L 20250815010645.2980846-1-alison.schofield@intel.com
$ git show | grep -A1 Notes
Notes:
    Link: https://patch.msgid.link/20250815010645.2980846-1-alison.schofield@intel.com


Dan Williams (3):
  b4: Move linktrailer to a LoreMessage property
  b4, ty: Move git_get_rev_diff to __init__ for reuse in post processing
    shazam
  mbox: Add a --add-link-note option to shazam

 src/b4/__init__.py | 53 +++++++++++++++++++++++++-----------------
 src/b4/command.py  |  2 ++
 src/b4/mbox.py     | 58 ++++++++++++++++++++++++++++++++++++++++++++++
 src/b4/ty.py       |  7 +-----
 4 files changed, 93 insertions(+), 27 deletions(-)


base-commit: f760a0468f91296750af072f7b3aed916f217e77
-- 
2.51.0

