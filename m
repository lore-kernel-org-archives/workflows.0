Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A72018FDDE;
	Tue, 21 Apr 2026 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776784497; cv=none; b=ZxaRUdGylRow0NglQ8Ud8TD5QdlbCYJUDKZrLVKX++je6HFFoFeTlzCmKYK2Ll+HTzNMahHgCGJC0i4CF5vsgzozup4CCu2TdnXxxxJBDPkNiDC6BZ+44brKeRYxuKGdPHT6miYtsfFGsewOwbond66hePZknYQd+rkQVLY7/jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776784497; c=relaxed/simple;
	bh=NG/mXi0uxm0woqSyxMy0Rqc160kI5g68fTLMlFKjrxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gVljpywBYY8u8Gk9QsL45OsFA8Vh72Re9sYopXy/QKVrzt3sSTXjXrsvYgCj95jdFYDAC8ziGBqx2VWOT1odT46OSGeU7QJSrmGTIsJIMT+yIVwUWMYgZEFomGmmZH4KpqXNo7YQKbqts9ctTqjd8ZqrILOpAt5/Vd756U92OC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+cZGiL3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+cZGiL3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E54C2BCB0;
	Tue, 21 Apr 2026 15:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776784496;
	bh=NG/mXi0uxm0woqSyxMy0Rqc160kI5g68fTLMlFKjrxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B+cZGiL3B/nlHm48z+lxTAkAxy2TyqwaYoLbjes8nAcKefZ0V8cf6+kcN+oLWIX6u
	 wmuI0vyPrQEKHwc5QA6I7eZXuTwD0IbJnVmxSFasBmoxZpopZpXYiuwoDqCK03hMfs
	 ZLYuGUvue9W95Dy5BMnJ9bor14jChfXfyl65/BoJzckZMCUdGXhQW9ZRCU4SoldVsw
	 wskpM3UKN203kFWCwN+pL87qEn4lmLv9FK1ad7CVxprJTerOlE9y6edW7162LE9Xhq
	 uYAzjavllC/YKjcyPlT/g/nAzyV3H04zCEDUk+Quod9r8jMi0kTGIAmSsl4HCP2T/n
	 Q+8vjkG+0Hwuw==
Date: Tue, 21 Apr 2026 11:14:55 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Blake Morrison <blake@truealter.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: coding-assistants: add optional Acted-By:
 trailer
Message-ID: <20260421-simple-dingo-of-piety-d033ad@meerkat>
References: <20260420142741.3187814-1-blake@truealter.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260420142741.3187814-1-blake@truealter.com>

On Mon, Apr 20, 2026 at 02:27:46PM +0000, Blake Morrison wrote:
> The existing policy correctly separates AI tool attribution
> (Assisted-by:) from legal accountability (Signed-off-by:). In practice,
> contributors increasingly work across pseudonymous and legal-name
> contexts, and a third slot -- identifying the human sovereign identity
> under which the work was performed -- lets downstream tooling (CI,
> provenance trackers, identity systems) bind a commit to a stable handle
> without disturbing the DCO.
> 
> Add Acted-By: as an optional, informational companion trailer. It does
> not replace Signed-off-by:, does not change DCO requirements, and does
> not mandate any format; the out-of-tree
> draft-morrison-identity-attributed-commits defines one such scheme, but
> contributors are free to use any handle form they prefer.

This is fairly orthogonal to what LF is already attempting to do with OpenVTC
(https://github.com/OpenVTC). I'm giving this a NACK for now, not because I'm
trying to stifle this work, but because it's going at it from the wrong angle.
The "Acted-by" trailer is clearly intended to be a field for a cryptographic
hash, not for a name/email combo.

As such, it will most likely never be accepted by the kernel community for the
same reason the community rejected the Change-ID trailer -- it's an obscure
string of characters that requires specialized tooling to parse.

Reading the IETF proposal, this is just one of the trailers proposed, as the
following are also mentioned in the draft:

   1. Acted-By:
   2. Executed-By:
   3. Drafted-With:
   4. Identity-Signature:
   5. Identity-Key-Id:
   6. Identity-Anchor:

I see that they need to be "optionally provided" but I can guarantee you that
a maintainer that sees a patch submission with a slew of trailers like that
will reject it (and you will get an earful from Linus).

I recommend that instead of starting by introducing a new trailer on the kernel
list, you send your overall scheme proposal to the git list instead. Some of
the claims in the draft are questionable (e.g. that tree hashes survive
rebase or cherry-pick operations), and are specifically suspect within the
context of the kernel's patch-based workflow. A tree-hash for a patch created
by the submitter will almost certainly become invalid when the maintainer runs
"git am" on their series, so the proposed scheme will never really work for
the kernel, because the vast majority of cryptographic hashes will never
validate.

So, NACK for now, and I do recommend you start on the git list instead.

-K
