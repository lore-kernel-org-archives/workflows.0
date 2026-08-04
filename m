Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B17643CE65;
	Tue,  4 Aug 2026 09:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785835420; cv=none; b=cY5LbvVKeU0405j3UKUn6F4MuZk5b+GdR2zikKvh5dCuPsNxHAM4oCbnwWa+Ap0/H8DI4lf+L7pLGKTaO8zTtdJGIBXFcgs3sPhJIqvH4sgjKrNWamcZo2G4RRs3zb1Ql1MQ5kxr9vOngUfvly6N6QtqH1LjqNROUZ6E+masHr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785835420; c=relaxed/simple;
	bh=a7k3PAD81l8Lu0gFOyVPNi+FztGnKZ/gzfFZpAYwLn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hoIOy4CjUexfGzs1BLi3baf50JYJI5xGKbs4HDLGD6BBn/O29bvncfFfq+HkTq4RgjMWQyrlenBOVC8alaC2u20sxVbTbsMhIM8BrnKZTY88fvQGtWmX8cXA/zahoq/k5BepzVjAMcnRmUY4taG5cUIjsxPp0KuOWxhpvuwTd+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNxE5s2A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNxE5s2A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2A21F000E9;
	Tue,  4 Aug 2026 09:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785835418;
	bh=hDHbjDuqGNvSS6pGVKeVZlPF3Y10+sj4+hoHtGP6Sxo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GNxE5s2ATsGgTmwulQisTPNuFR51vt4RI9cPmsMLkvT0yQj8DdLfXpg3Q2ZoGgt29
	 5GQtzHElI89lnMlePYFKW5SCxRVHzKIaYND9ItXD2M/Ks+QK2zA8HfIDl2YMNeUMiK
	 6bnTJv1KPvunx9NK3TBHTcb9VtpqiZJP8cZzQLF7DSYKIXk/AoT+imOPkQPqirrBkf
	 mSa1ck6dQ6ssMER495QQW426m90zcrQVa89+CJKbaYPD/6wcbl2+XlIC390RyAsLzT
	 xAtKhBNUX7kTwcBwtj07dbdtaeJ6ko/tkLZyWuszJtgGEuFigxCKBm+uyggvNIX739
	 UIXjnDYFk2V0Q==
Message-ID: <072936e0-d8fc-4960-80cd-c4fbd702b0c5@kernel.org>
Date: Tue, 4 Aug 2026 11:23:34 +0200
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coding-assistants: simplify attribution
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Konstantin Ryabitsev <mricon@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Jori Koolstra <jkoolstra@xs4all.nl>, Sasha Levin <sashal@kernel.org>,
 tech-board@groups.linuxfoundation.org, Jakub Kicinski <kuba@kernel.org>,
 workflows@vger.kernel.org
References: <87qzkuahlr.fsf@trenco.lwn.net>
 <20260722-accurate-defiant-puma-a7e23b@meerkat> <anGCdTMRCA09cDKV@lucifer>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <anGCdTMRCA09cDKV@lucifer>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/4/26 10:10, Lorenzo Stoakes (ARM) wrote:
> On Wed, Jul 22, 2026 at 04:48:03PM -0400, Konstantin Ryabitsev wrote:
>> On Wed, Jul 22, 2026 at 02:34:40PM -0600, Jonathan Corbet wrote:
>>> -  Assisted-by: Claude:claude-3-opus coccinelle sparse
>>> +  Assisted-by: LLM coccinelle sparse
>>
>> I've been playing with this a bit, and it's pretty easy to teach the agent to
>> add a few tag-like notes as to how exactly it was used, e.g.:
>>
>>     https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=018b87444d32eb2ffee7cb25f0785e54aa35f7bf
>>
>> This has:
>>
>> | Assisted-by: LLM [design, codegen, tests]
>>
>> It tells us a bit more about *how* the LLM was used, without introducing the
>> advertisement or pinning exact models.
>>
>> This format should allow for multiple tool usage:
>>
>> | Assisted-by: LLM [triage, tests], coccinelle
>>
>> I don't suggest this is included in this version, but it *is* fairly
>> straightforward to add to AGENTS.md and tells reviewers just how exactly the
>> LLM was used.
> 
> I think perhaps this should be a follow-up (this stuff is so fraught that I am
> super-glad to see Christian's suggestion fly through and want to take gains
> iteratively on this :), but completely agree.
> 
> David suggested something like:
> 
> Assisted-by: LLM # < what it actually did in the patch >
> 
> So I think we're kinda aligned on that?

Once the patch from Christian is upstream I can follow up with some
changes. I was holding that back for now until there is agreement on
the LLM part.

-- 
Cheers,

David
