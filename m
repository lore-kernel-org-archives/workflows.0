Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757349;
	b=llyrUNxD6cN7XCsYz8aqQC6JQMYbkJ9LAYRt8D/Kfe+1+zhlWT8bLU99e8npJrBAAktk
	 TSiRVGeBVbB6VXata5oQJZ18xVBcf5Ez4Gg/Wah4xOVGajq6d6BxEl0GPAAI1MAUJxln6
	 XCF2pIUSEig7zM3eXKcLmQRnmjbK7YQcCsgBIijL4ED3HUByTyUPmPr2qRi2JCrhg2Y/S
	 T202OHt4iKZwY5p2TK9lDjFvaa7p4VPpZYRxB0gT2H1cjX/bwG17m/bHZjGukqGYXcl8H
	 ts1w1/Jyn7udbuguJk1NA3bwS+ht1kVDwMazG+Lj06YHRh+5iNFyMWEqWorUjMLBO3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757349;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=4KRbKbSS4txsXMmx7aNLIAcb7TQXx/+yCJ2Kow7a3pM=;
	b=nkafb1Zq3rkqWrlfGXvF8wWGQ+I8Ua0XZcsk3S/DPI3hgIFq5Qv78PSWsCIhL/0Sy+LW
	 YFqgj+IaIDSPkUEmqMLNP1fc4D9d0KebWaL+ZHHX+4CjvkgCOikM4q89iC7DE1gtuy5EX
	 XODdLMY5c9tlHuGGjFpOHOMP7tuh63bWOf/u6xIkFyQOMceUq5/4y7lV7WAFkewmR9x8e
	 yd+I12kFDGh55srnpy0SNJDx+O8nvmbkHjJSrsVIvTdQcH3hMSHNwLTT8Im22hEUxF9T+
	 dC8A6gcEq1weU3fEyz8CMh/znAgDkh4POBzQoKWP6YAuaUDIMx3Dya8p6H8/RX2TQjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=YKxpuIPv;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18112606A31C;
	Fri, 27 Nov 2026 05:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18112606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=YKxpuIPv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1795757345; bh=4KRbKbSS4txsXMmx7aNLIAcb7TQXx/+yCJ2Kow7a3pM=;
	h=From:Message-ID:From;
	b=YKxpuIPvxZn6uIWz2Tri4r+Wl5/tQVetTcJlhWrzGdnarLQMnjA8UAAD3jH5oUg/Z
	 Hw4+2XupBr/qgyP60n1gdy3OhBbfY6SWIjGun9TGefzkf2sSna2/B/UdsfyPcBcnaE
	 Q83sTE+YvjvpAtwR+SixkCzsCADwe1/8DQ57YPgM=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 0946AC0960;
	Fri, 27 Nov 2026 06:29:05 +0100 (CET)
Date: Fri, 27 Nov 2026 06:29:04 +0100
From: Willy Tarreau <w@1wt.eu>
To: Sasha Levin <sashal@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Leon Romanovsky <leon@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Borislav Petkov <bp@alien8.de>, Marc Zyngier <maz@kernel.org>,
        Eric Dumazet <edumazet@google.com>, Hans de Goede <hansg@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Jonathan Cameron <jic23@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Theodore Ts'o" <tytso@mit.edu>, David Hildenbrand <david@kernel.org>,
        Security Officers <security@kernel.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: security-bugs: ask AI-assisted fixes for their
 cover letter
Message-ID: <awkVIG1fGfgGX-nr@1wt.eu>
References: <20261126171926.2766137-1-sashal@kernel.org>
 <20261126171926.2766137-3-sashal@kernel.org>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126171926.2766137-3-sashal@kernel.org>

On Thu, Nov 26, 2026 at 12:19:25PM -0500, Sasha Levin wrote:
> coding-assistants.rst asks for a cover letter with the evidence behind
> every patch an AI assistant prepares. A fix for a security bug needs
> that evidence as much as any other fix, so name the cover letter in the
> summary of that procedure and in the list of recipients.
> 
> The cover letter goes where the patch goes, which usually includes a
> public list, while the reproducer goes to the maintainers only. Say
> that the reproducer and the steps to trigger the problem stay out of
> the cover letter, which only mentions that a reproducer exists.
> 
> "Length" asks for short reports. With the complete output in the cover
> letter the report has no reason to carry it.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  Documentation/process/security-bugs.rst | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
> index c7dfecc87764c..0423a814c6a1e 100644
> --- a/Documentation/process/security-bugs.rst
> +++ b/Documentation/process/security-bugs.rst
> @@ -233,8 +233,8 @@ At the very least, when using an AI assistant to find and report bugs, make the
>  assistant read this file and threat-model.rst before proceeding, and have it
>  follow the procedure described in coding-assistants.rst: work on an up-to-date
>  mainline tree and note the commit ID, verify the bug is real, write a fix,
> -build it warning-free and checkpatch-clean, commit it with a Fixes tag, and
> -identify the maintainers with get_maintainer.pl.
> +build it warning-free and checkpatch-clean, commit it with a Fixes tag,
> +identify the maintainers with get_maintainer.pl, and write the cover letter.
>  
>  On top of that procedure, the AI assistant **MUST**:
>  
> @@ -244,10 +244,15 @@ On top of that procedure, the AI assistant **MUST**:
>     the description of the problem, the reproducer or its status, and the
>     triggering conditions.
>  2. Start the report with a temporary section listing the recipients' addresses
> -   (maintainers+list for the patch, maintainers only for the report and
> -   reproducer), and with instructions reminding the reporter to check that
> -   their email client is properly setup (see email-clients.rst), and leave it
> -   to the reporter to remove that temporary section.
> +   (maintainers+list for the patch and its cover letter, maintainers only for
> +   the report and reproducer), and with instructions reminding the reporter to
> +   check that their email client is properly setup (see email-clients.rst), and
> +   leave it to the reporter to remove that temporary section.
> +3. Keep the reproducer, and the steps that trigger the problem, out of the
> +   cover letter that coding-assistants.rst asks for. The cover letter goes
> +   where the patch goes, which usually includes a public list, so it only says
> +   that a reproducer exists. With the complete output in the cover letter, the
> +   report itself can stay short.
>  
>  A more detailed process is covered at https://github.com/masoncl/kres.git.

Good points above. And the cover letter might help for one case we've seen
a few times: among the few reporters who follow the rules (patch to the list,
report+repro private), a few forgot to mention the patch had been posted
publicly so we asked for the patch again. If a maintainer (or security team)
receives a 2/2 message, it's more obvious that 1/2 was posted somewhere else.

Reviewed-by: Willy Tarreau <w@1wt.eu>

Willy
