Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795744228;
	b=M30pESNsou4njAvDdW4ghXAJUPj8EiqI2/XtbhLHXupmKCWHfesmpDbcKNxkh7T5mkwn
	 AaF3LuYnYFuhbt/u1YdUS4BTEOedGOI072NsucxnXzdD3PznjTTVwWYtuUDyxrR6zBpcL
	 vVzwCzcki4nXaQFTRf7zrNsQj+WOt2k9UJuYrOlyYHC01UTxQ37zSnfRVDn7u38qn1pOk
	 GKbVa2F2CF8uWbtOucd0YEQDfNeaHggcoHl1NloYD8Pu1z0GTeKJSx+IvtHxLfqIDjnP0
	 YjsNWaNufvlXDr1IWFUR3IV8O8BLkSvBMDZOb7NYY81W86JiA+3ItCY9ip3dQpWAFLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744228;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uUavxelTZRtFV0GBlnXp7zzHRPVbuF2ydfagKIyAC6I=;
	b=LtGSO9UUwwinF12xqB2Fo2aj6gek7B6r5HvxKVDgHEKrpZN/02io4EXcepee5yn4A94s
	 Tu6E1C+kedGCq2lGrHPYAEfKypWYoaRTgJSINw9LICCXCjDYr7EoNzFtTSVVi+0YDJHxB
	 Y9fZF6Wdeop0i/WGso2ZA7jYDzqGyl5qZSBA3YgyqfjX3KwHefTKwLGl7G5C9bNUvzuI3
	 LalgH08MSRx6m+7HRPFdw/hIuB5yGD0PKgsL7EwqLbKhOL5XYSEFoNthnsV0UsCCpIVC1
	 QJnxpAeb+pgz/A3qJhA+WLO062xE5uys1f8QWO6+Zjox7qDbs3WBhhLks8YqSqwqiUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=X4oontNW;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9599F606A31C;
	Fri, 27 Nov 2026 01:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9599F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=X4oontNW
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 21AB640E0219;
	Fri, 27 Nov 2026 01:50:25 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id F4nSUESuFsq6; Fri, 27 Nov 2026 01:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1795744221; bh=uUavxelTZRtFV0GBlnXp7zzHRPVbuF2ydfagKIyAC6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4oontNWub6DK1ACbhGnPPvfWTxg+N6xqcMDviD75yX9EOkr8tU59KFI4Yhlzk5+L
	 h2I/Lj3fJmJ206MHZ+KRKFEjB64R3PFTG73Ztt33Wqo+ug4QmVKv6mBc3iCknmJW81
	 LqmUvJyEb/mvJNs18coEcFjuQS8D+VZO3dXL7TnCgebDHxjPVtF95ascABpPCLf/WU
	 QeLX4m4xNB1ELRX5X2+9Drhx8Jc9HGwChSOZSrT/rdZHpqSQWeDmBCEVIeMNOUXeGe
	 ZVOJVMLWd8q5UmJbvoC9CNW7za/kpNgugmHzQ9IY2n5LF8cryNiaF8Cq2R+XalE5eR
	 3qBpV0IAjbTOGdfeChDe8mtomBDSskLmgTefyyPTOFSeLAebi3gtnQFhDVVZVBDX/Z
	 +zhSKFRJ2v8+a5JCcmdj1SA+eDCszsH4ZYd7f9LCL9OCy83G6bbzDG6GHgTBJBDC4g
	 BvlEYq6gbkao+0P3n3k8B+vT49sRO7JHBMvzcQl6kfMoNskNH9ENOZsjCsG1gwfNNy
	 zKJzaUboJjp9HchAawT05gX45+MkRu4BB6FfAoHQedUMx4EljFfoXV98BGowihRaCZ
	 KwuUsuo3vORov9p9wTYnHJ5Mpi4/O8T4HwhRP/8KV0iT3KsRRNXyKxfTY273DcAvbI
	 +Szu+RaH8qccVC0ilMwkNhkM=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2ABD140E00C2;
	Fri, 27 Nov 2026 01:49:57 +0000 (UTC)
Date: Thu, 26 Nov 2026 17:49:55 -0800
From: Borislav Petkov <bp@alien8.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Willy Tarreau <w@1wt.eu>, Leon Romanovsky <leon@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Marc Zyngier <maz@kernel.org>, Eric Dumazet <edumazet@google.com>,
	Hans de Goede <hansg@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Jonathan Cameron <jic23@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>, David Hildenbrand <david@kernel.org>,
	Security Officers <security@kernel.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: coding-assistants: ask for short changelogs
 and a cover letter
Message-ID: <20261127014955.GBawjhw2j2YEUeiG1G@fat_crate.local>
References: <20261126171926.2766137-1-sashal@kernel.org>
 <20261126171926.2766137-2-sashal@kernel.org>
 <cf3596c6-742e-49c1-a90b-941d300d0b4a@kernel.org>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cf3596c6-742e-49c1-a90b-941d300d0b4a@kernel.org>

On Fri, Nov 27, 2026 at 02:34:26AM +0100, Krzysztof Kozlowski wrote:
> On 26/11/2026 18:19, Sasha Levin wrote:
> > Commit messages written by AI coding assistants are too long.
> > Maintainers keep asking for them to be cut down [1][2][3][4]: they read
> > like a copy of the assistant's analysis and bury what a reader needs.
> > When an assistant does trim, the opposite problem shows. A few lines of
> > a backtrace do not tell a reviewer how the failure was produced, and
> > Leon Romanovsky showed a case where only the full log revealed that the
> > crash came from an out-of-tree module written to provoke it [5]. Willy
> > Tarreau suggested a short quote in the changelog plus the full log
> > attached [6].
> 
> Shall we rather ask them not to write commit msgs at all? By writing
> commit msg we encourage - or try to encourage - at least basic
> understanding of what the patch does.

Agreed.

Just have the LLM write a commit message and then the human should go
and whack most of it to the bare minimum of coincisely explaining the thing
and cull all the bullsh*t.

I constantly do that with submitters' overloaded bla nowadays. And don't even
get me started on all those explaining what the patch does. There's not small
amounts of text which basically spells out the code in the diff, in English.

/facepalm.

Anyway, I try to hold on to this structure below, with variations ofc, if
needed:

"1. Prepare the context for the explanation briefly.

2. Explain the problem at hand.

3. "It happens because of <...>"

4. "Fix it by doing X"

5. "(Potentially do Y)."

And some of those above are optional depending on the issue being
explained."

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
