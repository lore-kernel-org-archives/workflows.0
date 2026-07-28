Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122FD44839C;
	Tue, 28 Jul 2026 16:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785255003; cv=none; b=EwTl7Fo0Cug5TR1vB445HVfxZOtnXttC7E+kPradCJ2JBem46c1vHWR9b9hwxYK0WZrAP8NyeK/pmzTi/Kl9KNhqr/CYjf0S8QbFCxamj580O/BnbKV5PLQTB3N3qN+v79561dLBOtbikuVfwe/lZNJiXAsv806YK1u0vPZ+z9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785255003; c=relaxed/simple;
	bh=bpztgt9P8tRPPFa5RkW2VtLWXK3gMhD8crEcuc4zIRM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uun1qDCXC9d6NiqPrq0FMb6Hui8vwLGmwWkveacEhhD0M2Bj0za8NdBIFLaHRzdhptZ8Icn6A9zOn+M9gtLmYeT3caSb32B5BWUKi+kBZajYls+2s6u8Z68f409PSOsWWFuuJUyifZ3qhSp/ZkvJ7QWML6YSfjOWjf/KX3/bDz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf09.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 39B92A1412;
	Tue, 28 Jul 2026 16:09:54 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf09.hostedemail.com (Postfix) with ESMTPA id 9A21320025;
	Tue, 28 Jul 2026 16:09:51 +0000 (UTC)
Message-ID: <e099826edfb82a4c3a0719d54261e7d070ffae04.camel@perches.com>
Subject: Re: [PATCH] checkpatch: Validate committer sign-off
From: Joe Perches <joe@perches.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson
	 <bjorn.andersson@oss.qualcomm.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
	 <lukas.bulwahn@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	 <skhan@linuxfoundation.org>, Andy Whitcroft <apw@canonical.com>, 
	linux-arm-msm@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 28 Jul 2026 09:09:50 -0700
In-Reply-To: <86ef62b5-9896-49cd-9beb-4e7435a6324e@kernel.org>
References: 
	<20260724-checkpatch-committer-sob-v1-1-68550513106b@oss.qualcomm.com>
	 <933506f1f210d3498d515d55266951e1914cbc9b.camel@perches.com>
	 <ameceGEbXlQNGOEt@058f6326d650>
	 <86ef62b5-9896-49cd-9beb-4e7435a6324e@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 9A21320025
X-Stat-Signature: aj1itiu6xkkc7qkohcueq9ji9h9pn1s7
X-Rspamd-Server: rspamout03
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19MHfTlLStweo4nHWOK0YKIrG5OHRSqYak=
X-HE-Tag: 1785254991-438316
X-HE-Meta: U2FsdGVkX190G+E9bwzyzMxSaxHHfkI3plpDSeyQ980TNv6kBR8KnZsPnXABK77WDQAb5eJi5Yxqv9/adrz2RHZSnZziXOlo2uIyRMgHby5xfC7fPyTcss0ZxQRiLuTQxn/mVk1UkWwbUghm+hHfTJqln8Ap2/vcXFQ5oVdwOasdO3XnP07FIxN0u3T+tbkP5Z72HlweUNy8+yP1XO9+CmNboRHgTueKVs6vvBm1hauU3PCLySKfEU1RXrsGJ+SVV8UjGQNEilXn2Gpk3kHx49WQ04QgaCNLm7F8LC4w23jXYiuPFSGvnaeQgZrum8+L

On Mon, 2026-07-27 at 20:24 +0200, Krzysztof Kozlowski wrote:
> On 27/07/2026 19:59, Bjorn Andersson wrote:
[]
> > > > checkpatch validates the Signed-off-by trailers against the patch's
> > > > author, but misses the opportunity to also validate the committer w=
hen
> > > > run with --git. Maintainers therefor need third-party scripts for t=
he
> > > > final Signed-off-by check.
[]
> The issue Bjorn is trying to solve is real and as he pointed out - every
> second day maintainers fail to commit properly (srsly... still!). Some
> of us implemented git commit hooks [1][2], but many still don't care
> enough, even though installing such commit hook is basically 30 seconds.
[]
> Maybe checkpatch would help people to get it right...

Alright, I'll look at this proposal more thoroughly.
