Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4463A9D9D;
	Mon, 20 Apr 2026 14:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776695288; cv=none; b=Ye5LbWZqt8Fnb1bcw/JIEp71m72Zv/8se3iLE09e5QVTz/USYcSqskmWLIGAf0nytc80bbeh01wxbh65CKLVKJOT3+4O7dXu0s/VV1E+1EPPzMg20hlhjc+zEWw/xv/zyNwzQ/+6r1MQkQwyoHe5Zp3K2R1V8Xp1lp0umfAoiWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776695288; c=relaxed/simple;
	bh=/PcTdK1h8kwNooUf9BUoU7EzyjDEqdpQ/JAWGtWVJrA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qP2aUli5dKkUqXzj0++qtqjUfAe+6R2EUDsCuxvnmZKO+ueU124ahTXYUDI4MWjI8fa6fUfCs8zYb5AOHnuCQeV+X09G5vQaOFfVQtL7ypujQedE7PVATjUXp2n//PjH+LaVaxonnNtNPgceoGLodYXtFYM82fceGvYmKBBdZfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truealter.com; spf=pass smtp.mailfrom=truealter.com; dkim=pass (2048-bit key) header.d=truealter.com header.i=@truealter.com header.b=KB5/4Zhx; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truealter.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=truealter.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=truealter.com header.i=@truealter.com header.b="KB5/4Zhx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=truealter.com;
	s=protonmail; t=1776695273; x=1776954473;
	bh=51Yg2gjpI8RiSgZOWoyjCEc3bs4AEIyrwgizLJnVA3k=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KB5/4Zhxr7yIQe+iwK8jHia1U7Ffgl+PHrU7/+vo5RoRcKvM33T+iJaEHCPvMZUJt
	 F7XBIwGBa2U2NxJwQo3IHBUC9chn9qzNTK7Q3TcYnAskwtS5o4O/nYYHiATJ3Mi3Dr
	 UivujbDAyINTPRLF3kcUl3tWUz+vi8xzVL0kOqmLquUTU5KdYqiYeGTG2Qs1IUHSjS
	 aORhH3uzVlAJgIpPp2upOQRivDmV4r9z8LpGg4g4Krs/zokp2zuZ4LH8df52A6c9FO
	 HqpFV7UC6/zKyTBhwaaNP352AJSr58xTN0S2jgP6y8zk4m5PcNIai8ONTWu7ZzGUps
	 MhdFyA5F7g60w==
Date: Mon, 20 Apr 2026 14:27:46 +0000
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
From: Blake Morrison <blake@truealter.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Blake Morrison <blake@truealter.com>
Subject: [PATCH] Documentation: coding-assistants: add optional Acted-By: trailer
Message-ID: <20260420142741.3187814-1-blake@truealter.com>
Feedback-ID: 187617253:user:proton
X-Pm-Message-ID: 5a4112a0fbe40da112428c99a06b241beb122efc
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The existing policy correctly separates AI tool attribution
(Assisted-by:) from legal accountability (Signed-off-by:). In practice,
contributors increasingly work across pseudonymous and legal-name
contexts, and a third slot -- identifying the human sovereign identity
under which the work was performed -- lets downstream tooling (CI,
provenance trackers, identity systems) bind a commit to a stable handle
without disturbing the DCO.

Add Acted-By: as an optional, informational companion trailer. It does
not replace Signed-off-by:, does not change DCO requirements, and does
not mandate any format; the out-of-tree
draft-morrison-identity-attributed-commits defines one such scheme, but
contributors are free to use any handle form they prefer.

The three trailers then map cleanly:

  * Assisted-by:    -- what tool drafted this
  * Acted-By:       -- who the human was, as a handle
  * Signed-off-by:  -- legal DCO attestation

This mirrors the informal separation already present in commits that
carry both a pseudonymous Reported-by: and a separate Signed-off-by:.

Signed-off-by: Blake Morrison <blake@truealter.com>
---
 Documentation/process/coding-assistants.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/process/coding-assistants.rst b/Documentation/pr=
ocess/coding-assistants.rst
index 899f4459c..b1d2d2f66 100644
--- a/Documentation/process/coding-assistants.rst
+++ b/Documentation/process/coding-assistants.rst
@@ -57,3 +57,16 @@ Basic development tools (git, gcc, make, editors) should=
 not be listed.
 Example::
=20
   Assisted-by: Claude:claude-3-opus coccinelle sparse
+
+Contributors may optionally add an ``Acted-By:`` tag identifying the
+human sovereign identity under which the work was performed, in a form
+stable across pseudonymous and legal-name contexts::
+
+  Acted-By: handle
+
+``Acted-By:`` is informational. It does not replace ``Signed-off-by:``;
+DCO attestation remains mandatory. Where ``Assisted-by:`` identifies
+*what tooling* contributed, ``Acted-By:`` identifies *who* the human
+was, as a stable handle. Handle format is out of scope for this
+document; draft-morrison-identity-attributed-commits in the IETF
+document stream describes one such scheme.
--=20
2.53.0


