Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093192;
	b=GX+nR57s87KLDz61m353u6sK5qDZgjDE7TwCH5umIF/HWRwPCOFpTgVU71j972SRrYen
	 zSo2hQ+P5iPE6fwXQEbKxbCEgbttd7IPB/x+qKrBq0A06WPczdg5rspZZoOkwuRW0ryW3
	 RfzIjy72w/VQzgNQUTglCeuJ8cLeLN5g83zb4FD3wXfI1EcAikZA8lxXHm59miorWhORB
	 fE4p4Q6kCvsLwmSbx+n3navZIlIcfbzPO7PwQwWboOv5Y13qUdWq69DiXDl9MyG8mnclz
	 y0wcivpU/IjlSH/vaj+FCqpUFW94SVKrTrBAcBfi2xviLkCN+Ox92+7lm9v5P1JE8Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093192;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=nxNuTL9cAUP6SWKqItcQMnWLISeHywbqJpIktpUVo3o=;
	b=1M+2vmr2NGGyrvwC1SeuTrIeb/NHvOttTHYNEs6IE6e9YbiOg/MpL5b/hu7mX8WHExr2
	 WOWoFHV75b1NM0PHI4Hls/TOlQiGWRzOyjewrbav4qwUQNnE0FQBZ9lw0Rl6gDj15JKZ+
	 AKsm8JvefEuhE/K2Xc5zw93JKj5MvCNEqV0TNgUFWQC9X6rtiR9BP1A4UwBmeIGVnyxuV
	 GvKg4eY4uAmTcl1AcHFpq38k351ZIgg7p3p2K22fWdo2d1cbZeHY/c0W0JIQVJXlyZ6Pp
	 ccIhJ47Jto/A/2+5rWIYzMARXaUY/IchW8d6w3MMNVDuIgHjhJG4V5qbqfRvoSn3FLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HTjoI3Vl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED73606A320;
	Thu, 19 Nov 2026 12:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HTjoI3Vl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206BF1F000C5;
	Thu, 19 Nov 2026 12:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795093191;
	bh=nxNuTL9cAUP6SWKqItcQMnWLISeHywbqJpIktpUVo3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HTjoI3VlKS/RjET7InvpNAjzqBuB/hc/8tKiXM6WnU5RMetUTlq9J8NTgjqkI2RAo
	 e6Em8AyPZljPR1bT7XlwQxQTThv+OU5Pdiiro+riwhi/6kH3SJp34CVahzPrPV7p+M
	 JwEBUcobx1BprB723zwGIiGnN79GDJOBQblGetUbCHiV3loMA7IpT0mzGXbxDkNU1u
	 maYBh8SML9TDe7htnmYxc5RbquvbVJImB0C8cKXiClA7eaydaJ7Ec0XSzxcq90Uavt
	 zgw5w083JhTdMyr84N1q89HdNIOeg5oK0kBZn9MG63hX9qxQDsxHwUjMd8pTynnlr8
	 f9kZU/t81rjxA==
Date: Thu, 19 Nov 2026 14:59:47 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>, David Hildenbrand <david@kernel.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: submitting-patches: ask bug fixes for their
 user-visible impact
Message-ID: <20261119125947.GK162713@unreal>
References: <20261116200515.352387-1-sashal@kernel.org>
 <20261117092723.GA124972@unreal>
 <avxtxScVa9KvUH_K@laps>
 <20261117152721.GC162713@unreal>
 <av7s5eV7Ws9Io3cE@1wt.eu>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <av7s5eV7Ws9Io3cE@1wt.eu>

On Thu, Nov 19, 2026 at 01:34:45PM +0100, Willy Tarreau wrote:
> On Tue, Nov 17, 2026 at 05:27:21PM +0200, Leon Romanovsky wrote:
> > > > Since you're already making changes in that area, could you add a sentence
> > > > asking reporters to provide the full dmesg stack trace?
> > > 
> > > In this doc, we already ask them not to [1] :)
> > 
> > This is really bad. You assumed they would trim the logs correctly, and I,
> > as the recipient was expected to trust that they were accurate. They are not.
> > 
> > They trim everything, which makes these logs useless to me. As I said, they
> > include AI-generated reports, cases with reproductions that are impossible
> > with upstream code, and reports for completely out-of-tree code. Everything
> > like that was visible in original dump stack and it is lost now.
> > 
> > > 
> > > > Many AI-generated patches reduce it to one or two lines, which gives no
> > > > indication of whether the report is genuine or fabricated. Early in the AI
> > > > era, I saw some completely fabricated stack traces.
> > > 
> > > Is it still an issue?
> > 
> > I don't know about faked, but useless yes, especially in the cases where
> > in-kernel API is involved.
> 
> The situation completely changed over the last year. LLMs that would
> hallucinate bugs and dmesg in single-turn conversations have been
> replaced with agents/harnesses calling shell commands and able to
> capture contents without inventing them. I agree that we should ask
> them to capture such dmesg which nowadays have no reason to be faked
> anymore.

The meaning of “faked” has shifted. As you said, it previously referred to a
completely imaginary call stack, now it refers to a custom module that abuses
the in-kernel API. The latter is still “faked” because it cannot be done with
the current code and unlikely will be possible in the future.

Thanks

> 
> Willy
