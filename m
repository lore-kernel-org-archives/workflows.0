Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802609;
	b=aliXK0AyuV9RO6fedYHcFPIu/gUE7r4VovlE6P4EXHHTFmWfK6s9/BXZYCqAxMs77lVr
	 dLYQqxt9SCFcVBIONTwPnl2/2PkreqQR3D/E9jXzbajVG4kaa6bmAE9kF91FXmEvdvClo
	 /ae8Ctcpzq0hYPgqHnn8EbPTj2CpvDUx/prr/RbvT2mQcV30RzQYZKIVu6ie1S89Du8e3
	 wSRlFJF13/5KEs3pVPh7HV9Zg7o4UUwb+dsgS+Qdv0pXdYbevuNmV/FCt9oSqpmUupqqT
	 cc8MFp2MgDy1WbY90NPjRg+eEc0S2kEIU8+LDRo87lZibErbLEFJylYR3Ua7yiKJ+6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802609;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=IReSkSwkQKl7NvtaU3+COhoF1pbztg5zdL7eqGyZjeQ=;
	b=1YDEgQWmxZ0T6viIsZ/U01SgS7BEzU93LGO14Suz/qRXJ5r4E0g9ULZ3dUTT9odU5oYd
	 +T75RNQsC86pNsgcYxnGPsAICCzXerlOmVBKW/2y9ozy/haxYWVDRrQWLB2/g88sRfj5s
	 1T8vR5NgJrmbetiVN/IHa9Xj1TFaJGypZv5xiZhdfiIG3GZw0UnM0dPHhVeX7J9V/iKid
	 cBzRoe3PO+1lPgOqXhg88BsEjCV+6+NTCOWD7y7uMojJ9iVakGOkmRWX1oug6phxgze70
	 1bn4E8YDg203hZfA0kiXcVBNgkOAPfsdA+t+AyEXSufmx/la6J5aLYV3I+4mAW+eN3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mlqGHd5w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994F0606A31F;
	Fri, 27 Nov 2026 18:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mlqGHd5w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F95B1F00897;
	Fri, 27 Nov 2026 18:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795802609;
	bh=IReSkSwkQKl7NvtaU3+COhoF1pbztg5zdL7eqGyZjeQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mlqGHd5wQLOxZIk0f4sGq/b/4Pf+nkXT9YhzVnbCb0U5RiSKuBvvh6kjs9lrq/NUa
	 wb57ZZaI/8SsWxX1Bg9WxTcFVUYx4Gy1FRcntyiOBO1QdCFeaTHOKgBPeE1uPTTwS5
	 P1ogEgT3OEftUyzyJirb34CW+8tKi1Pv07tLSrN1fAcFmKeZaYSBd6dgCBa8NqzO8i
	 9YwRqU1/RGkVrOo0hAdCFwp8+qKD0NJVuKUOV0qgcRAqQQXEJBFzL1mn4CTPIurphQ
	 HbRZ6nz5/fG3yyyeBNXgap364qE+0UnyrnHcE8b4/4Sl/yGjaK33nyKyXCzx3ZS6NV
	 ZuLvTlWLgo+6A==
From: Sasha Levin <sashal@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
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
	Andrew Morton <akpm@linux-foundation.org>,
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
Date: Fri, 27 Nov 2026 13:03:25 -0500
Message-ID: <20261127180325.2304501-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <33de19df-1729-4d1c-a6ce-e10e240e0c57@kernel.org>
References: <20261126171926.2766137-1-sashal@kernel.org> <20261126171926.2766137-2-sashal@kernel.org> <cf3596c6-742e-49c1-a90b-941d300d0b4a@kernel.org> <20261127014955.GBawjhw2j2YEUeiG1G@fat_crate.local> <awjopqoCJqwChwnF@laps> <awlCy3vDs0fKx1ku@gremlin> <awlNYsu1y8EhYgor@1wt.eu> <33c6cf3a-6b18-4e09-bd5c-68ed2c34de56@kernel.org> <awlR9pQUjodcLjZK@gremlin> <20261127133756.455469-1-sashal@kernel.org> <awmJ2c87NSDjtSwp@gremlin> <20261127143124.1039470-1-sashal@kernel.org> <33de19df-1729-4d1c-a6ce-e10e240e0c57@kernel.org>
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

On Fri, Nov 27, 2026 at 06:51:17PM +0100, Vlastimil Babka (SUSE) wrote:
>If you then do 'b4 send' and it's a single patch, it indeed puts it below
>the '---' line. So git am discards it.
>I think it makes a lot of sense? If there is a single patch, it should be
>self-descriptive anyway, there isn't much information necessary to explain
>the whole series, if there's no series. So you might consider some extra
>info/context useful for reviewing, but not important enough for a commit log
>you want to see doing a git blame later (but it's still reachable via Link:
>anyway). So putting it below the --- should be good enough.

Yup, that works: git am would drop it, and it's still on lore for anyone who
follows the Link:.

The concern I thought folks would have is that it creates a big wall of text
before you get to the diff itself...

What about putting it at the end of the patch mail instead, after the diff, the
same way format-patch --base adds base-commit? git am ignores it there too, and
reviewers who don't care about it never have to scroll past it.

-- 
Thanks,
Sasha
