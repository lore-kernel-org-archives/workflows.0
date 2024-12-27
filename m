Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8363719A;
	Fri, 27 Dec 2024 00:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735260942; cv=none; b=Ec0QxBiVnIqUNZ3l8sx6q6AYLWSrEOiSXA8RspT9ZicWZ5sPetiqeZEAa/VNyYg+3m30DFIFXQeUEZ7c+YnLiD+Cbn9InNVqUwfW+Qk4qx4xYFChk+WsBVvlY4UunODN31EnSIC6NMAkT7yp8rCjJJ3dBq4b315cfFH6qGpdIyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735260942; c=relaxed/simple;
	bh=L9PEqeW6jvAuPGa5Qhx0vKQx0TaA0v+XCVX1gdDW7PI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BA52FIujQl2FzUf3wdblFJtaq8NWjAUQzi75QNVMm0ute//P/Z/fnMUNtC42yBx1inS5t3AtrKP486Qyam77ASKayHr2VpN5FCR4CrbY0nhTFyl+slZRnn/VDnpZRxhsrLL0ilJDEq965umbcm829aLKFlx/pyDHDdESENU5vPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MnDuhOR/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MnDuhOR/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C1DC4CED1;
	Fri, 27 Dec 2024 00:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735260941;
	bh=L9PEqeW6jvAuPGa5Qhx0vKQx0TaA0v+XCVX1gdDW7PI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MnDuhOR/42mM2zSmFLLK0wnG4M9pKv/gpvjLZ0GT8vHGBXp4OTIwl/XI5LXN8a7Ux
	 XguuK4ycDy08rR0iwxiIycqdZBcL8kSGjZgLxg1XrxVjGkESEGLSe7pfDyOxrfrdlY
	 ZmsBKlFVM/NGZh3N+V3y6utnrRr4LbmX9BvZqPbszyF+/UxomPrQhSufG0O9TNkbOG
	 4DGhXv28dN07NhF9IBTs7o9PWMHZKdrMNAcMzgT5vduuRQr8iN3tlc9NrDjJ1dUVov
	 XgU3o63XAmxyTCvDOWKeFH43EJmYG5AG+g6i/ShSeky1Mw4hmtT/UbwirXS8iHxWFC
	 00UszVakQqQDQ==
Date: Thu, 26 Dec 2024 19:55:39 -0500
From: Sasha Levin <sashal@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: apw@canonical.com, conor@kernel.org, corbet@lwn.net,
	dwaipayanray1@gmail.com, geert+renesas@glider.be, gitster@pobox.com,
	horms@kernel.org, joe@perches.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@leemhuis.info,
	lukas.bulwahn@gmail.com, miguel.ojeda.sandonis@gmail.com,
	niklas.soderlund@corigine.com, willy@infradead.org,
	workflows@vger.kernel.org, kees@kernel.org
Subject: Re: [PATCH] git-disambiguate: disambiguate shorthand git ids
Message-ID: <Z237CwC_YKhoZubs@lappy>
References: <20241226220555.3540872-1-sashal@kernel.org>
 <Z23ZmVwgS2ErX-dj@lappy>
 <CAHk-=wiPNpQ=zmGvPoZRMFZ7a7mm2pzSoOsuQPdDRaSF7gbw9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHk-=wiPNpQ=zmGvPoZRMFZ7a7mm2pzSoOsuQPdDRaSF7gbw9w@mail.gmail.com>

On Thu, Dec 26, 2024 at 03:33:36PM -0800, Linus Torvalds wrote:
>On Thu, 26 Dec 2024 at 14:33, Sasha Levin <sashal@kernel.org> wrote:
>>
>> Which means that folks should be able to use a fairly short abbreviated
>> commit IDs in messages, specially for commits with a long subject line.
>
>So I don't think we should take this as a way to make *shorter* IDs,
>just as a way to accept historical short IDs.
>
>Also, I absolutely detest how you made this be all about "short IDs".
>
>As mentioned in my very original email on this matter, the actual REAL
>AND PRESENT issue isn't ambiguous IDs. We don't really have them.

What got me worried originally is the example Kees provided which
creates a collision of a 12-character abbreviated commit ID:

$ git log 1da177e4c3f4
error: short object ID 1da177e4c3 is ambiguous
hint: The candidates are:
hint:   1da177e4c3f41 commit 2005-04-16 - Linux-2.6.12-rc2
hint:   1da177e4c3f47 commit 2024-12-14 - docs: git SHA prefixes are for humans

When I tested it locally, my scripts were broken, our CVE scripts were
broken, and it is quite the PITA to address after the fact (think of all
the "Fixes: 1da177e4c3f4 [...]" lines we have in the log).

So sure, we don't have a collision right now, but going from 0 to 1 is
going to be painful.

Are we going to be actively watching for someone trying to sneak in a
commit like that, or should we just handle that case properly?

>What we *do* have is "wrong IDs". We have a ton of those.
>
>Look here, you can get a list of suspiciously wrong SHA1s with
>something like this:
>
>    git log |
>        egrep '[0-9a-f]{9,40} \(".*"\)' |
>        sed 's/.*[^0-9a-f]\([0-9a-f]\{9,40\}\)[^0-9a-f].*/\1/' |
>        sort -u > hexes
>
>which generates a list of things that look like commit IDs (ok,
>there's probably smarter ways) in our git logs.
>
>Now, *some* of those won't actually be commit IDs at all, they'll just
>be random hex numbers the above finds.
>
>But most of them will indeed be references to other commits.
>
>Then you try to find the bogus ones by doing something like
>
>    cat hexes |
>        while read i; do git show $i >& /dev/null || echo "No $i SHA"; done
>
>and you will get a lot ot hits.
>
>A *LOT*.

I ended up with this fun thing:

git log --pretty=format:'%B' | grep -E '^Fixes:[[:space:]][0-9a-fA-F]{8,40}' | while read -r line; do
     [[ $line =~ ^Fixes:[[:space:]]([0-9a-fA-F]{8,40})(.*) ]] && \
     ! git rev-parse --quiet --verify "${BASH_REMATCH[1]}^{commit}" >/dev/null 2>&1 && \
     { r=$(./scripts/git-disambiguate.sh --force "${BASH_REMATCH[1]}" "${BASH_REMATCH[2]}"); \
     [[ -n $r ]] && echo "Bad: $line" && echo "Good: Fixes: $(git ol "$r")"; }

Which looks for these wrong IDs in "Fixes:" tags and tries to run them
through git-disambiguate.sh:

Bad: Fixes: d71e629bed5b ("ARC: build: disallow invalid PAE40 + 4K page config")
Good: Fixes: 8871331b1769 ("ARC: build: disallow invalid PAE40 + 4K page config")
Bad: Fixes: 7e654ab7da03 ("cifs: during remount, make sure passwords are in sync")
Good: Fixes: 0f0e35790295 ("cifs: during remount, make sure passwords are in sync")
Bad: Fixes: ee650b3820f3 ("apparmor: properly handle cx/px lookup failure for complain")
Good: Fixes: db93ca15e5ae ("apparmor: properly handle cx/px lookup failure for complain")
[...]

>Look, I didn't check very many of them. Mainly because it gets *so*
>many hits, and I get bored very easily.
>
>But I did check a handful, just to get a feel for things.
>
>And yes, some of them were random hex numbers unrelated to actual git
>IDs, but most were really supposed to be git IDs. Except they weren't
>- or at least not from the mainline tree.
>
>For example, look at commit daa07cbc9ae3 ("KVM: x86: fix L1TF's MMIO
>GFN calculation") which references one of those nonexistent commit
>IDs:
>
>    Fixes: d9b47449c1a1 ("kvm: x86: Set highest physical address bits
>in non-present/reserved SPTEs")
>
>and I have no idea where that bogus commit ID comes from. Maybe it's a
>rebase. Maybe it's from a stable tree. But it sure doesn't exist in
>mainline.

This one is indeed in the 4.18 stable tree.

>What *does* exist is commit 28a1f3ac1d0c ("kvm: x86: Set highest
>physical address bits in non-present/reserved SPTEs"), which I found
>by just doing that
>
>    git log --grep='kvm: x86: Set highest physical address bits in
>non-present/reserved SPTEs'
>
>and my point is that this is really not about "disambiguating short
>SHA1 IDs". Because those "ambiguous" SHA1's to a very close
>approximation simply DO NOT EXIST.
>
>But the completely wrong ones? They are plentiful.

Is the concern mostly around the term "disambiguate"? Would
git-sanitize.sh work better?

-- 
Thanks,
Sasha
