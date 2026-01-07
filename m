Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7736A33B6F9;
	Wed,  7 Jan 2026 19:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767814741; cv=none; b=tYUeCxBotB+3gMquNYLfpMHoWThHC4crhRmYEpVaJA8aNl2WYalrImQZHOFvnBso749itSm4eY27ppoGRH5jOCkzRWJoQL/SzhsZg4+yhT2wl8lk6wRiLKj8LdBBpcoFjW8CpF7UHJM+nzvOZ9dHlb7AbEZ3inc0cgJZCx9rnJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767814741; c=relaxed/simple;
	bh=OiHKxYtjxg32qIgexqg9vuqB56t7QY266JHqWTwOE0U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DBiCDoEW5xXPihECgJU2KBVbQVuZc7HbzSAETjAAOs+2VAHKHyXDslrZOkUVe1zUMkMGZM2aSBh/xuhkfH7IiBkpF9nx2wm9BJWb0boPeDJjGXjREIrFEDTj4c6EdNORph/BduZzJt3xmr79uwJaEBDZZjCuk9oNP8iUFvKUVDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id C6EBD1604ED;
	Wed,  7 Jan 2026 19:38:45 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id ACF326000C;
	Wed,  7 Jan 2026 19:38:42 +0000 (UTC)
Message-ID: <dc44dd2c6efb16ace506085922707c70126117e7.camel@perches.com>
Subject: Re: [PATCH] LICENSES: Explicitly allow SPDX-FileCopyrightText
From: Joe Perches <joe@perches.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Jonathan Corbet <corbet@lwn.net>, Andy
 Whitcroft <apw@canonical.com>,  Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-spdx@vger.kernel.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 07 Jan 2026 11:38:41 -0800
In-Reply-To: <2026010726-crusader-recoup-4825@gregkh>
References: <20260107171246.242973-2-krzysztof.kozlowski@oss.qualcomm.com>
	 <4702253d918c8edb899a91fbd79b40199a013264.camel@perches.com>
	 <2026010726-crusader-recoup-4825@gregkh>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: o3hjh6u665w7q1ngwpwac6i3ej9cbx99
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: ACF326000C
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18xLqUBePl34TjQp3oJfOe+LD+Un8ATmTY=
X-HE-Tag: 1767814722-932982
X-HE-Meta: U2FsdGVkX18aCjojfg6QQg+nfGB6yvucaBoY0VG/q7KUNvDi5cXqYKd4zyfc5630hpLafsLCQU182krvPHPfdLx2AjVQ64DIkjUbRvRCGPXR1Wx8NN8pxN6b1XdlU2jsntzfgmJobSfYyECcW9J8uh8GZZFQDcdVPQoNPodDnFjdXkRREPRbEQhLhC+UuV2kA5TjrBIJEkbHnQ8FQQm7BpLRxEBHBfD7fLGSbGFh2DbFRuzbtDLuEudQNujteSaGsVNAkp3bx8TM4Rw1gM8SgeezIvdzFI+Muke/8haWyjl3IJAJS5tOflFIAvEgS0qq

On Wed, 2026-01-07 at 20:35 +0100, Greg Kroah-Hartman wrote:
> On Wed, Jan 07, 2026 at 10:40:11AM -0800, Joe Perches wrote:
> > On Wed, 2026-01-07 at 18:12 +0100, Krzysztof Kozlowski wrote:
> > > Sources already have SPDX-FileCopyrightText (~40 instances) and more
> > > appear on the mailing list, so document that it is allowed.  On the
> > > other hand SPDX defines several other tags like SPDX-FileType, so add
> > > checkpatch rule to narrow desired tags only to two of them - license =
and
> > > copyright.  That way no new tags would sneak in to the kernel unnotic=
ed.
> >=20
> > I find no value in this tag.  I think it should be discouraged.
> >=20
> > How is it different or more useful than a typical Copyright or =A9 symb=
ol ?
>=20
> It's easier to parse automatically and put into other places (like a
> software bill of materials).
>=20
> I don't like it all that much either, as really, it doesn't mean much
> (go talk to a lawyer for details), but it's already in our tree so we
> might as well document it...

Document it doesn't mean encourage it.
