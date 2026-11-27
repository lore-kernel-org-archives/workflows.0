Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795796887;
	b=DDUlOmWXCfIP9IROxMhagVsDOeWsty8GiQs4Z78GNKWGWrTJprhid/VV1MDfmO8ToPK1
	 5S/IHhNd5eC5vv5JagD9k7cAdyJSJnXJjlncmB7vbMt280oghrdhQU/az8o/94GjAbfFk
	 v67Xbb6tQryxN9/Oe/sreemlaimnYGao0afR9vhGBnM/cAUeZjg7JTsXo2X5FpT1r2lxw
	 h9JNPLCTZsBr8QhPC54XNoiTSTx/pUihYdHIKcq0sNzYUFZTRGkfGCM37a5ttZ5mp3V7F
	 EceoVe4CiKYWJMKYdwYh8Dr1P4Dv60Kdevy0volZm+xxdf1dTmzZXyIllaS5GHPSmPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796887;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=RE449hdXjDfZ9lfTsQ/wHKgoP0IBy8MiOMaH0f+BiYI=;
	b=nQQ1fzRhUrPj8dbEFz6YskRC1IwZUd/GYXKBk9irlvDPKLXti4ANyOeZ6dRZQpz9VXAU
	 wORd8PR0PtvyGbJVooSl0hcjGs1f2EMvQ0MiiRp2IjSl//p6wQt62PObcAhPMQdC+lQeq
	 haX9jZFbCtJLKaE9Jnsl3AO+i2WHiJ91M02KycOxNL0lQDDv4oElL4FzUkRsQYISSSRVP
	 3xoqUOWaohWub4SxKttJ2xaGpPT5HUG7iCyfFEL2pw+JbmF06XtNq2RnvkUjaWiTfrN31
	 7bvRvtpp9FfZWu3K6Kc0qjhILXgZ2e1qDz64RqvSbcgxk62NZA7V3NnLhTU4wMjXT/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=2gPJlDFG;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692C0606A31E;
	Fri, 27 Nov 2026 16:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 692C0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=2gPJlDFG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RE449hdXjDfZ9lfTsQ/wHKgoP0IBy8MiOMaH0f+BiYI=; b=2gPJlDFGUs6opx3O3g2ST85Zve
	zHN6dHn7VCgUUDSClLyFvuRYA0KOG/Sm69uNSo+oaZN7V/IdHFvuj0X/q52xTcYCAkXML+BmuBX/2
	H4XC9I+wl3/kT+67WW5NWPLsbU8jy1oSbOofIYBKOEk5nbelBcSb/KPpg66vet/uJlT0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWynU-001plE-1v; Fri, 27 Nov 2026 17:27:40 +0100
Date: Fri, 27 Nov 2026 17:27:40 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sasha Levin <sashal@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Willy Tarreau <w@1wt.eu>, Borislav Petkov <bp@alien8.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Leon Romanovsky <leon@kernel.org>, Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Marc Zyngier <maz@kernel.org>, Eric Dumazet <edumazet@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Security Officers <security@kernel.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] docs: coding-assistants: ask for short changelogs
 and a cover letter
Message-ID: <71acea69-b7ad-4090-ac57-8d562c5c3bfb@lunn.ch>
References: <awjopqoCJqwChwnF@laps>
 <awlCy3vDs0fKx1ku@gremlin>
 <awlNYsu1y8EhYgor@1wt.eu>
 <33c6cf3a-6b18-4e09-bd5c-68ed2c34de56@kernel.org>
 <awlR9pQUjodcLjZK@gremlin>
 <20261127133756.455469-1-sashal@kernel.org>
 <awmJ2c87NSDjtSwp@gremlin>
 <20261127143124.1039470-1-sashal@kernel.org>
 <awmU4L01OH9kWEVv@gremlin>
 <20261127153902.1320179-1-sashal@kernel.org>
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
In-Reply-To: <20261127153902.1320179-1-sashal@kernel.org>

> One question though: what stops you from ignoring the cover letter altogether
> and looking only at the commit message? We can have AI explicitly tag a
> "slopped" cover letter if it'll make it easier...

Some subsystems 'git am' a patchset into a branch, and then merge the
branch into there -next tree. The cover letter is used as the commit
message in the merge commit, since it is supposed to explain the big
picture of what the patshset does.

	Andrew
