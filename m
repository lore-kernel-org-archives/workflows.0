Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821964;
	b=YHDDUsJdxm/looMeiq22x/VEzmCgnxwTuhiik1hqw/OGBsydhTmvUf1BpFMEMjPf+zg7
	 mbb+ekPFd7LkLb/f4F9VejHH+CtN+yP6kWyehRcbkmJe0Chy18W3nnYrNpRjnPzgdukDd
	 AYkyCIfUdnls7wdr9EhgYLm0v2ZQFLTiF2mWIznjqqAVWT2zE/jbYXqjcM7GONhLFWoK8
	 13n9JbbmhwMLrpywwW9AvrYRPtj9R+Ot9bvCFJj0E6Ft3wm7J9k2/0Japgo5by/WgGHDa
	 9WTDDlwAybVWhoKctTbjnHpLbN9FMY4cOJxqRBOcwiFwUfMVBqUG2WRuz5z6ZTin1jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821964;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=W8h5u/3o3wOnfN6HMt5EslRSpikSCt9aWR4Ee6rfpQU=;
	b=KDhbrs6sC4WNt15pZbrjat10NF2EpbLPKij3aASg9TKSouQzdswT223mL7oM+Rn1g3jt
	 KSYBdvEjSMk62I+ja9Xdvh4ldpPTSxgJ99FkXzKhTMHMlxHAO2yMEkKK4IUc1EIMgVywd
	 jZY4mRBMu5+Eqk8211BoXRS7d6UuTbp6JuFFBvw/MzjoK5A0N7NwqxLHCTAtB/NolF2PY
	 7muPtU47l+mkJh11oDJ27KVARo9bJlB3fxxeed+1gx/lny1Sx+OtMBxhnwOsGlqDpAP7a
	 5vxf2lYKbHmS+i3OCGekO0tQkhqcxLvrfPFgpKUGTw/Ow6XuD79Bywy9jY2HjLnFo6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UVQoOPK0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44233606A31C;
	Fri, 27 Nov 2026 23:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UVQoOPK0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73FD01F00899;
	Fri, 27 Nov 2026 23:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795821964;
	bh=W8h5u/3o3wOnfN6HMt5EslRSpikSCt9aWR4Ee6rfpQU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UVQoOPK0EsQGUqzcYgIo5zswQoar5XSUMrz9MAvcw6d/0twRcWEd9H2tta3uL8ZoT
	 RJuJPNiDdlN61hGsnhVOSyC9OCL/oz0U13zZSbXZDAx57G6Ff/XqLVV/qr6WZiPZ2u
	 9d4cRUTEloWOFWCg4xSZvrFFEBPo26iRAv1I7/21riulxK4991rNwefustA9+E57zH
	 wFDmT3QVmcLHh7NZNe2vs++J9XhuNGij6WlOagvK9QDP4bDqzBXTHYX1/UfCM/GIV6
	 aZV+Faodex3CBfnrWvkz5lTB6II2u/kEK0ANVTaRA6reeqE4VOiLWr/U/WrgaGHX43
	 KCknZRk290X3w==
From: Sasha Levin <sashal@kernel.org>
To: "Liam R. Howlett" <liam@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Willy Tarreau <w@1wt.eu>,
	Borislav Petkov <bp@alien8.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Marc Zyngier <maz@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Jonathan Cameron <jic23@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Security Officers <security@kernel.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] docs: coding-assistants: ask for short changelogs and a cover letter
Date: Fri, 27 Nov 2026 18:26:00 -0500
Message-ID: <20261127232600.3012681-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <iesgqewdy4dou4owj5lhgfq23jcydmvs32qdgil6cklt4br667@bfvlauc3jyen>
References: <20261126171926.2766137-1-sashal@kernel.org> <20261126171926.2766137-2-sashal@kernel.org> <awlNYsu1y8EhYgor@1wt.eu> <33c6cf3a-6b18-4e09-bd5c-68ed2c34de56@kernel.org> <awlR9pQUjodcLjZK@gremlin> <20261127133756.455469-1-sashal@kernel.org> <awmJ2c87NSDjtSwp@gremlin> <20261127143124.1039470-1-sashal@kernel.org> <33de19df-1729-4d1c-a6ce-e10e240e0c57@kernel.org> <20261127180325.2304501-1-sashal@kernel.org> <61b33977-7c05-4d30-9a78-8fc711bd95ef@kernel.org> <20261127182602.2521454-1-sashal@kernel.org> <iesgqewdy4dou4owj5lhgfq23jcydmvs32qdgil6cklt4br667@bfvlauc3jyen>
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
Content-Transfer-Encoding: 8bit

On Fri, Nov 27, 2026 at 02:30:23PM -0500, Liam R. Howlett wrote:
>Are you saying we need to invent a new placement because there was a
>dmesg wall of text with details buried in there that might have been
>overlooked?
>
>I don't think accepting a wall of text will solve that particular
>problem, but it is currently why more reviewers are quitting.

On Fri, Nov 27, 2026 at 11:08:51AM -0800, Andrew Morton wrote:
>I agree with everything Lorenzo has written!
>
>I dunno Sasha, everything here seems rather .... wordy.

It might not sound like it, but I agree with Lorenzo too.

1. What we have right now isn't working. Look at all the complaints about AI
changelogs, and at Lorenzo having to drop reviewerships over it.

2. Trying to engineer a prompt that gets this right will be pretty complex.
There are per-subsystem differences, it's hard to find a good array of cases to
teach the AI to follow, and different models behave very differently and
produce different results.

3. Just prompting it to be more concise/less verbose/etc won't work either,
it's already way too subjective...

On top of that, even between subsystems we have different styles of writing
commit messages. There's no good or bad here, it's very much subjective, and
the AI acts like a toddler trying to copy everything we throw at it and
failing. Not only that, humans are not the greatest at writing commit messages
too, which doesn't help.

I'm very open to suggestions here. There's no specific approach I think will
work best, but I very much believe that this is a problem we HAVE to solve.

-- 
Thanks,
Sasha
