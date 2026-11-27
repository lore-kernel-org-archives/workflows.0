Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795801885;
	b=EkKzgSPNOEHBtOuGECFpiJcRRqlIu189eMxjIHZfYpyId8liPDhzejGCaXyD3cDLccGz
	 b3LURojOaPkGWknfMsvrmxJS5sN1cDCI2vy3d68r9baszxYJYap6WPJVS6FPgAn66dgb4
	 uehwrY26VpiJgSEYcGgJfc7rjDELVlfkcx3+5KGQ4mdkH3o5JJa7Je5+9e7AlNma2omOR
	 1jBxxMGsmI1G9K04MN6niNMr4Fw5nGT7YPns+GFr0qZdgDITDyeJrWuNZTfF+Azp1b46h
	 o3PCos8EwNA2oQtfmiiRFE7AM2RNIW3sKXFzwyUqhpJ9wnLkuLOBWtLrhkncCEuZ9Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801885;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=vZUCFIgUPUAkwneDlYHb0hMYoy5QBl/Pl9WSaWIz7y4=;
	b=Czd94mC8YHZnTL4vEOvfgm/sAw1haZsvhjVFBBp+R6n1fn/9x/6p889TtDWsJdODruf/
	 +Bn63ikB2lxNT3QEIiaYb7pP5SCiDB44XEwED97hoxTPkrHOfbABDRHE6/DgJNtk6H5Ba
	 OV4NpyESsTZXp6IdYEdm4yMpCzm2s6zrb/jCUK/NCmS4YxMhcmL7tulJqPs4txWO6Di2J
	 HR5LquCXG9uVlxflHmepH5GVPmpDEPV+WLMAjdfYmBpT4BeQQsn9dVkg2XSkwQYAa3dcB
	 MFpmLV6Hhs7k2sT9CG/jbatrCe0SHyGgWyof6n2ao2L2aCc0qBpX857btFGtzbKZbkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sh+Z9zUQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09533606A31C;
	Fri, 27 Nov 2026 17:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sh+Z9zUQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E2A1F00893;
	Fri, 27 Nov 2026 17:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795801884;
	bh=vZUCFIgUPUAkwneDlYHb0hMYoy5QBl/Pl9WSaWIz7y4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Sh+Z9zUQOQDS9AA3I7rOGEsY+9NzfIRIxL8zeELyYOpYS72uhYMcJ8VVWvTQCy7Vb
	 F5BBiD9Or6/F298ntI4IOSetQnzPF5Y832xSkqxhbZL5SfJqjRLh7t/SC9u8W7doiD
	 aWgnfbbR/TYzuKGlTOyo3sZsdcTqNe3pIg4Y16aSanJTWbzjm7/eY0npPkkdhPo7x6
	 pSwqiQkMwaKotrc0REto9UhN2vOACFz0hPV11ulDklYGa7zJC5iJtjLxIbGZy9H/OH
	 Mg7K31FTEYZMI764ZwnPe2h9fjOKm3RHVJ+J0BJnHiS0+6yEnjBaW/XXqqCPBep5FM
	 GjVhr8e7lHDMg==
Message-ID: <33de19df-1729-4d1c-a6ce-e10e240e0c57@kernel.org>
Date: Fri, 27 Nov 2026 18:51:17 +0100
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs: coding-assistants: ask for short changelogs and
 a cover letter
Content-Language: en-US
To: Sasha Levin <sashal@kernel.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Willy Tarreau <w@1wt.eu>,
 Borislav Petkov <bp@alien8.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Leon Romanovsky <leon@kernel.org>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Marc Zyngier <maz@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Hans de Goede <hansg@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Jonathan Cameron <jic23@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Theodore Ts'o <tytso@mit.edu>, Security Officers <security@kernel.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20261126171926.2766137-1-sashal@kernel.org>
 <20261126171926.2766137-2-sashal@kernel.org>
 <cf3596c6-742e-49c1-a90b-941d300d0b4a@kernel.org>
 <20261127014955.GBawjhw2j2YEUeiG1G@fat_crate.local> <awjopqoCJqwChwnF@laps>
 <awlCy3vDs0fKx1ku@gremlin> <awlNYsu1y8EhYgor@1wt.eu>
 <33c6cf3a-6b18-4e09-bd5c-68ed2c34de56@kernel.org> <awlR9pQUjodcLjZK@gremlin>
 <20261127133756.455469-1-sashal@kernel.org> <awmJ2c87NSDjtSwp@gremlin>
 <20261127143124.1039470-1-sashal@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20261127143124.1039470-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/27/26 15:31, Sasha Levin wrote:
> On Fri, Nov 27, 2026 at 02:20:15PM +0000, Lorenzo Stoakes (ARM) wrote:
>>On Fri, Nov 27, 2026 at 08:37:56AM -0500, Sasha Levin wrote:
>>> Very much the case. But we can't stop the "wrong hands" from using it, so we
>>> need guardrails around them that make it produce what we, as a community, think
>>> is the right thing.
>>
>>These aren't guardrails, you are just trying to modify the output of
>>something that's broken here IMO.
> 
> I see this as the beginning of a guardrail. It'll take us some time to get to
> something like checkpatch for LLMs, but we have to start somewhere.
> 
>>I think a placeholder works better, personally.
> 
> I don't think we can really instruct LLMs not to write the message. The human
> will just turn around and tell it to ignore that instruction and write the
> commit message anyway.
> 
>>+10. Write the cover letter described in "Cover letter" above from what the
>>+    previous steps produced. This part is not optional, not even for a single
>>+    patch or a one-line fix.
>>
>>BTW this seems to be instructing LLMs to generate cover letters for single
>>patches which I don't personally love to see.
>>
>>And it therefore gives the LLM double the chance to post awful word
>>salad. So I'd prefer not to have that clause ideally.
> 
> The single patch cover letter was something that was floated during LPC and the
> Maintainers Summit. The other option I was thinking about is a git note
> attached to the patch: format-patch puts it below the "---" and git am discards
> it, so it never lands in the tree. I'm open to suggestions though.

b4 tracks the cover letter (with to/cc list and its own metadata) as an
empty commit preceding the series itself, regardless of whether it's a
single patch or a series. IIUC the empty commit is less easy to lose than
git note, but that's probably not the crucial part.

If you then do 'b4 send' and it's a single patch, it indeed puts it below
the '---' line. So git am discards it.
I think it makes a lot of sense? If there is a single patch, it should be
self-descriptive anyway, there isn't much information necessary to explain
the whole series, if there's no series. So you might consider some extra
info/context useful for reviewing, but not important enough for a commit log
you want to see doing a git blame later (but it's still reachable via Link:
anyway). So putting it below the --- should be good enough.
