Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713570;
	b=oFRoEPj6usUXVXrDV5SQOpjvi52Xwc5PT7zE0bXPbiD63j03bHU1bpMepE9wWImmvujM
	 XX7gGbF+hpoo3Fc6IPw9uu803DM1fuMYq8n5A2dVm9S6S2mDac8D8eCrEK+21UFpW1gzb
	 4VWUIgaA0jfuVbaJYQ/JIxOJi1qmJ/ipAzTpsRh8vXKEwP1SUUQ2hE0pLii3fnc5nP+b8
	 iXY3WOEeaqjeaUQTUC0fOPkgAdhN2A9zK3Dyoz6hRIab+/mp6IpvVYGT8w4BVTEE6HEW3
	 gcQex7J1GH7rg0R3YwOexRQUpa2ujbb4pBd7LoM+6Bh4hjeevYAkffNBf+RJIapsSYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713570;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oSy2smLc3cNbTuqMdwegN2l5C49OxKMBQCUYEQkVoUo=;
	b=gN9ZwAsRl45RdZL6jid8zph5udqQCCn/oHRDB2zhON30Wej/Qbi1Mc7YsocoOTt6+mdI
	 q6LuVevpQg/KwCB9fDkkMLdzGLY85A5813VWqjuAkj3e/EcJ+3aMtk5u2sjZ3vfZbU2g+
	 TdkJfdSd5BSmrdGAyTzyoFH12oXTPZ+4siZoIGf68/kVT8ZZwyFYI4Uhkw7KotuvhxXJd
	 SCRo4tWn73lZ1fmnN4R5qLkdOHavcS9uVNQsfT7m+Dv1UcQ1BZ9/q/aLBsvpumyexCGEk
	 1ab14z1V8W3In5qnQrB/QWkm9fIi3ieUt7ipm3zLuhyq/idn0VqvrGwZjQO2Vh0MnpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UmRWgeKR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2336606A31C;
	Thu, 26 Nov 2026 17:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UmRWgeKR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB111F000C0;
	Thu, 26 Nov 2026 17:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795713569;
	bh=oSy2smLc3cNbTuqMdwegN2l5C49OxKMBQCUYEQkVoUo=;
	h=From:To:Cc:Subject:Date;
	b=UmRWgeKRj4DvIvaRNu1iZI/R0f19ezl7i4Zt8PH+IfgoPGiYLw151aOaZUmyWrzOB
	 Xjcvf/0hLWnwEub2FPU75PZaYXPIMdkd4UNCUl0dlX46BqRndiHo7hru8y5j9LFeZh
	 pF6/OPmjwHo1elLrVQr+Ka9ycEQ4gVwTm3EB5vLN0F8MLCozwmaDBskJBw89e5q0mM
	 Msx24JFRNZ2HOw3x6IYBMG4Rryb30Inc6L5NmmHYVvaYHvqcDbQvCHR1RB1RJ+PcDC
	 aXllP5nFm3SBN1EaH5InqZsyweKzAOCqmq1OI5diu7zEHA39+zXdNJ5PvF44zC1Sba
	 ZIRQWqww80pVw==
From: Sasha Levin <sashal@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Sasha Levin <sashal@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Willy Tarreau <w@1wt.eu>,
	Leon Romanovsky <leon@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Borislav Petkov <bp@alien8.de>,
	Marc Zyngier <maz@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Jonathan Cameron <jic23@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>,
	David Hildenbrand <david@kernel.org>,
	Security Officers <security@kernel.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] docs: ask AI-assisted patches for short changelogs and a cover letter
Date: Thu, 26 Nov 2026 12:19:23 -0500
Message-ID: <20261126171926.2766137-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit messages written by AI coding assistants are too long, and
maintainers keep saying so. Greg: "LLMs love to write a lot. Please
always rewrite the changelog text to be sane and concise." [1] Linus,
on a pull request text that read like an LLM's: "you can tell it to be
a bit less verbose" [2]. Marc [3], Eric [4], Hans [5], Andrew [6] and
Jonathan [7] are a few more examples from this year, from different
subsystems. security-bugs.rst already carries a paragraph on the length
of AI-generated reports. The messages read like a copy of the
assistant's analysis, and what a reader needs is buried in them.

When an assistant does trim, the opposite problem shows: a few lines of
a backtrace do not tell a reviewer how the failure was produced. Leon
showed a case where only the full log revealed that the crash came from
an out-of-tree module written to provoke it [8], and Willy suggested a
short quote in the changelog plus the full log attached [9].

This series gives each kind of content its place. Patch 1 tells coding
assistants to keep the commit message to the point and to put the
evidence into a cover letter, which every patch or series they prepare
has to come with, a single patch included. It lists seven items that
the cover letter has to contain at a minimum. Patch 2 names the cover
letter in security-bugs.rst and keeps the reproducer out of it there,
as the cover letter goes to a public list with the patch.

The cover letter stays in the list archive, and the Link: tag or the
patch-id of the applied commit leads back to it. The full log can then
be found from the git history without being part of it.

What follows is an example of such a cover letter, written for this
series. The seven items are about both patches unless one is named.

1. Based on docs-next d3b70c91af11 ("docs: ioctl-number: update DRM
   entries") plus "docs: submitting-patches: ask bug fixes for their
   user-visible impact" [10], which changes the same step 6 as patch 1.
   Nothing else was added. No architecture or configuration, these are
   documentation changes.

2. The problem was reported on the list, in the mails [1] to [9] above.
   No tool found it. The text of both patches was written with an AI
   coding assistant, Claude Code.

3. Not a kernel failure. The problem is in the patches that reach the
   lists: [1] to [7] are replies to such patches and pull requests, and
   [8] has an example of what a trimmed log can hide.

4. No reproducer.

5. scripts/checkpatch.pl on both patches: 0 errors, 0 warnings.
   "make SPHINXDIRS=process htmldocs" from an empty output directory,
   with and without the patches: exit 0 both times and the same 57
   warnings, none of them new.
   One trial of an earlier draft of patch 1, from before the paragraph
   on vulnerabilities was added: Claude Code with Claude Sonnet 5.5 was
   given a tree with the text applied, at the parent of 8e83fac77aa97
   ("bootconfig: Fix xbc_verify_tree() to check subkeys of valued
   keys"), and was asked to fix that bug, with no mention of cover
   letters. It produced a [PATCH 0/1] with the seven items in order,
   the captured outputs copied byte for byte, and a commit message of
   16 lines.

6. Nothing failed, so there is no output to show.

7. Not done: a full "make htmldocs", only Documentation/process was
   built. One trial with one assistant says little about the others,
   and the vulnerability case and patch 2 were not tried at all.

[1] https://lore.kernel.org/r/2026073057-moustache-unfixable-5ab1@gregkh
[2] https://lore.kernel.org/r/CAHk-=wgXU50=KgZNZc1JDxsSxg9Z+DjG1_2yU-fNXpZtUe4XDw@mail.gmail.com
[3] https://lore.kernel.org/r/861pf9xgkc.wl-maz@kernel.org
[4] https://lore.kernel.org/r/CANn89iKErdqHOGFpQLM_MAi-LcAaR6ZR2_rhdtZzv1TJc2L4RQ@mail.gmail.com
[5] https://lore.kernel.org/r/ab5c5ae1-1bfd-4fe4-adef-fb64b5b3dfbb@oss.qualcomm.com
[6] https://lore.kernel.org/r/ef2eb733-4b94-4c2e-9165-0b324733a482@lunn.ch
[7] https://lore.kernel.org/r/20261121195920.573a0727@jic23-hlaptop
[8] https://lore.kernel.org/r/20261125125739.GA14811@unreal
[9] https://lore.kernel.org/r/av7tY64O34gbJvH_@1wt.eu
[10] https://lore.kernel.org/r/20261116200515.352387-1-sashal@kernel.org

Sasha Levin (2):
  docs: coding-assistants: ask for short changelogs and a cover letter
  docs: security-bugs: ask AI-assisted fixes for their cover letter

 Documentation/process/coding-assistants.rst | 86 ++++++++++++++++++++-
 Documentation/process/security-bugs.rst     | 17 ++--
 2 files changed, 95 insertions(+), 8 deletions(-)


base-commit: d3b70c91af11cdf08aebbfdb166b333ada0276be
prerequisite-patch-id: 3fe9b4033dfb06bcc2898e76439d04a11a239c33
-- 
2.53.0

