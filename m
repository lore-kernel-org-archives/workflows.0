Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A359F47A6B;
	Sun, 16 Nov 2025 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763306747; cv=none; b=N+i0MZLcjG2pCTqL8yPefSUKFjUKE99CnT7a0UA9IWVxv9ja4i6HSS8lTBLrPvZCnjgQUsstUNG3FS2wEFSiPsqYYwd4q+thfAwMmCJksbvbqeGtdIlzuXZOarUPzZN1Pqh6xWNYYVp5Ub7ssUIyEMU0/L8raxJnzyylkOm2SZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763306747; c=relaxed/simple;
	bh=A+tbxqvyHtOMEbfWUyW4I6ppG86vNZ0vjjUxeCQhH/Q=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=VEoUl4+cm484o9qCCaTQGAN6vaEWyPGS9gzupt7tENjyU6zncTQPx9TGVQ97QTMp4EjMmOb5iokwlyF/OVgjaaJLDiYZomvcYkCKnCuovHYOhKO/33GZJIfmkAWyzzyfUIeRMNzw6cUs5Y7Kbh5gA/vYDni/WCcne63ze28HAA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqKygCyw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqKygCyw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F93C4CEFB;
	Sun, 16 Nov 2025 15:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763306746;
	bh=A+tbxqvyHtOMEbfWUyW4I6ppG86vNZ0vjjUxeCQhH/Q=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=YqKygCywAj6dqL/2i/SoDbqSo6TywirIqm3gDUoiH9BklBrOkT7L+c7Sc0aI3t2MV
	 TM+y5Z1L8qNsMbYG4JtCafHewTpkMiuwKbdvCyd69RTLtipE3fxVLULe9kpq5LX/aC
	 EiAEnqn/MSl/UW8cq5eIUyTMXGNGnJaC4tw/PtrWdOnfoiQdHgLlYdQq8TJVD7P9wK
	 2WP4vmvOEeOOq56ENaUt+44p/7O/u9ov70tW/JHJIch9du0jsUkH3tW8WCyTCN7NxC
	 1mGN0gDNiMllZNs+dHyog3Azo+1uQZ8cAGXl6xn0FDd/tIrpcqLFrcggn08vrrP48G
	 s6ags1V+LhkXw==
Date: Sun, 16 Nov 2025 07:25:46 -0800
From: Kees Cook <kees@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>
CC: Dave Hansen <dave.hansen@linux.intel.com>, dave@sr71.net,
 Shuah Khan <shuah@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, NeilBrown <neilb@ownmail.net>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org,
 ksummit@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_=5Bv3=5D_Documentation=3A_Provid?=
 =?US-ASCII?Q?e_guidelines_for_tool-generated_content?=
User-Agent: K-9 Mail for Android
In-Reply-To: <2804290.mvXUDI8C0e@rafael.j.wysocki>
References: <20251114183528.1239900-1-dave.hansen@linux.intel.com> <20251115140746.6a3acfd5@batman.local.home> <877bvqan70.ffs@tglx> <2804290.mvXUDI8C0e@rafael.j.wysocki>
Message-ID: <EEF974E1-08D5-4E67-8AC4-4315CF9D10C1@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On November 16, 2025 4:38:35 AM PST, "Rafael J=2E Wysocki" <rafael@kernel=
=2Eorg> wrote:
>On Sunday, November 16, 2025 12:30:27 AM CET Thomas Gleixner wrote:
>> On Sat, Nov 15 2025 at 14:07, Steven Rostedt wrote:
>> > On Sat, 15 Nov 2025 14:05:56 -0500
>> > Steven Rostedt <rostedt@goodmis=2Eorg> wrote:
>> >
>> >> As Dave responded to Luis, although that is a good idea, it's out of
>> >> scope for this document (for now)=2E
>> >
>> > I should have said it's out of scope for this patch, not document=2E =
The
>> > point is that what tag to use for this is a separate discussion=2E
>>=20
>> Which should be held in the context of this patch to make it complete=
=2E
>
>I agree, it would be good to get it all done in one go=2E

A tag isn't going to capture what we need today=2E Because the LLM usage i=
s so variable, it'll be, at best, misleading or, at worst, totally inaccura=
te=2E I've provided several examples of this where the range of LLM involve=
ment is very low to very high=2E The prior discussions have shown that we h=
aven't yet found a sensible way for a tag to capture that=2E

But the common thing everyone appears to agree on is the "show your work" =
concept that this patch is trying to capture=2E I think it's likely we'll g=
row a tag eventually, but it isn't something we understand the context for =
yet=2E As a first step, this document is designed to show the foundational =
goals for what we want documented=2E

Over some time of applying this, we'll start to see common patterns and re=
peated descriptions in commit logs=2E At that point, I think a tag will be =
warranted=2E But right now, we don't generally agree about what aspects we =
want a tag to cover=2E

-Kees

--=20
Kees Cook
