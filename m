Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B523ADB89;
	Wed, 22 Jul 2026 20:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784752483; cv=none; b=nCFwRtN7jcTcmsO6NL92dyugzU39vxkko14EbpQfeyftQlSog/dfYmHP3iebD1UjUMhTo+vUVyuxrVY3yZDLdbIEA2/DGAEYbRhm8rmIUhHWCftGxKH96C/1YjGX6+tbLth47QOO+ojQNHTorXQym+1HHBkaFkwLuhFdmmobfTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784752483; c=relaxed/simple;
	bh=3EM35DrazWHOGnL1WA0md6Y0yHSpTPtIDYTxY4sAnsI=;
	h=From:To:Subject:CC:Date:Message-ID:MIME-Version:Content-Type; b=WibEBbhdafsi9ZfNzojxZpXdbJLPvi9wZYH+3tPKzjEnAGInybGXnvxhtFHcopWbE3CKH95+t+iMcxvu2dz/GmLbGxIE+9+/xDzZyTLG5xdEGkAV5mF3ljQTuMhsOzPg1tYSwARgKaGv2cSmtqrhsYHobNvjIRccNo7T1A9aXF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Hp3Bouc4; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Hp3Bouc4"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 52B79408B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784752481; bh=pBK92qQP7ibC2nnHbqd5AtRi4H8CmvdEWSxkweTawTg=;
	h=From:To:Subject:CC:Date:From;
	b=Hp3Bouc4kQAYEpD9+gNMvQXxvNStUj3nlbEtekNHIImevtQtx4I8JD4gOfgRjfkC9
	 MxI60pqRgxE0cCj6cCkLECn3E9SQvmNn9PPVXLUmzMyOTDP9g2W92KX1O8N9+C7fcY
	 toPHGWiRmGM4RSZBopHOxaEMaxuJYbL1daZl1D27eiaXKjMKaVG6mgMLgXKoHsuvdR
	 E9miO/NAoll9FRH9vRy4wbSPnhN8ppmNUsKiLgoHFWhP0uWNbxiRp3iFV/+fmkvW5D
	 YnxkBQTnm8fGQZprGzDawOiwwy/njD8vodJP1Rn1mHGriYA+oqWQIh4TGjjD5Mm4PF
	 PhveNDAFGYS+w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 52B79408B4;
	Wed, 22 Jul 2026 20:34:41 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Subject: [PATCH] coding-assistants: simplify attribution
CC: Lorenzo Stoakes <ljs@kernel.org>, Jeff Layton <jlayton@kernel.org>, Jori
 Koolstra <jkoolstra@xs4all.nl>, Sasha Levin <sashal@kernel.org>,
 tech-board@groups.linuxfoundation.org, Jakub Kicinski <kuba@kernel.org>,
 workflows@vger.kernel.org
Date: Wed, 22 Jul 2026 14:34:40 -0600
Message-ID: <87qzkuahlr.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

As suggested by Christian, I have applied his patch to a branch and
simplified the changelog, see below.

I'm nervous about applying it still because I don't think it's my role
to set this sort of policy; I really want to feel that there is a
consensus behind it.  So there's some additional CCs here because I
would like to hear from some folks:

- This policy document originally came out of the TAB; is the TAB (on
  CC) OK with this change?

- At least one maintainer (on CC) have said that they currently strip
  Assisted-by tags out of patches before applying them, a practice that
  would seem to undermine the whole policy.  Would this change be
  sufficient to end that practice?

Thanks,

jon

From c31aa376a355e3b84b9e87ae1dbe19b394d4c82c Mon Sep 17 00:00:00 2001
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 1 Jul 2026 17:54:48 +0200
Subject: [PATCH] coding-assistants: simplify attribution

The requirement to identify specific models used in the Assisted-by tag
provides free advertising to proprietary software companies while adding
little or no useful information.  Change the requirement to simply:

  Assisted-by: LLM

to capture the fact that an LLM was used without tracking which one.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Reviewed-by: Jori Koolstra <jkoolstra@xs4all.nl>
Message-ID: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/process/coding-assistants.rst | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
index 899f4459c52d..fe34f3e7e828 100644
--- a/Documentation/process/coding-assistants.rst
+++ b/Documentation/process/coding-assistants.rst
@@ -43,12 +43,8 @@ When AI tools contribute to kernel development, proper attribution
 helps track the evolving role of AI in the development process.
 Contributions should include an Assisted-by tag in the following format::
 
-  Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
+  Assisted-by: LLM [TOOL1] [TOOL2]
 
-Where:
-
-* ``AGENT_NAME`` is the name of the AI tool or framework
-* ``MODEL_VERSION`` is the specific model version used
 * ``[TOOL1] [TOOL2]`` are optional specialized analysis tools used
   (e.g., coccinelle, sparse, smatch, clang-tidy)
 
@@ -56,4 +52,4 @@ Basic development tools (git, gcc, make, editors) should not be listed.
 
 Example::
 
-  Assisted-by: Claude:claude-3-opus coccinelle sparse
+  Assisted-by: LLM coccinelle sparse
-- 
2.55.0

