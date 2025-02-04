Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E562121516C;
	Tue,  4 Feb 2025 16:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738685584; cv=none; b=hFMUiJvwQI3dcEIxhoUvPce6GKCLFTh2zeBD4RdKUxch1DWAKWx9+eJvmZUrVgLavyBhUvGgMZJAtSYHm0VXG+v13z19AoiFm0DNvl32ML9jZL99oHDDMTEP95QeiKySs9q3lPiVLQ1f2kZCxERFhNu6QUMyspLUp1e0yp2K86g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738685584; c=relaxed/simple;
	bh=kDN+cZEWJ0y+gr5+wyDUwqCQ340N1h7v6kbhQyt2pZI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qtEuvr1XfTARX/+SoDuAIsSrwPw9HU6OERlEk/WC1F1+RqfuILkKyLtMDKvfxS3dcSe80lY2Px6Pryd/iwS0gvOJfXOmrwbB9IerHzZYw/xPmO4//dCQyA9xBd8h0JBfTdZTTL6Dbr81EkV0EJLH98LW8mLTSGJMNHy61ZEOvJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IszEr4KC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IszEr4KC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000FBC4CEDF;
	Tue,  4 Feb 2025 16:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738685583;
	bh=kDN+cZEWJ0y+gr5+wyDUwqCQ340N1h7v6kbhQyt2pZI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IszEr4KCTJWzXEtgb2i4RvWZipq+KEhZCu05O7hR0hjdP47BdvX8Hx6dMByfBjDRo
	 yjwKsm/OWjlKN9OWm+6iL/Ark+Z0v0y3GgLofosrm0WsbRL31Cp2Yqs6RuheFUNra5
	 KNJc5QFsYhVpYISc2o+p1xSEj1q97zemcGJaxe1fjbTARws3j/mM+/+35k8g/lWQHy
	 GwprktS+jaGvOZzJQdV0Opih6QgL2nnE+nJoOS9cVW0Jop+zc6Tv40i3Nh3Y2cOuEL
	 7g48kWQNnZKrI8Mh19NE9VUumX6+dLw33sm8xjKdSVNOs5LTKbhGVy+9J4lvUDHD+O
	 1yxlnrnPXfePA==
Date: Tue, 4 Feb 2025 08:13:01 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, corbet@lwn.net,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: document the format for
 affiliation
Message-ID: <20250204081301.6fdb1536@kernel.org>
In-Reply-To: <20250204154938.GF22963@pendragon.ideasonboard.com>
References: <20250203174626.1131225-1-kuba@kernel.org>
	<CAMuHMdXXNkpWjkKvMLd-MF=npzqJXMtnXkaba60JY7hCzyjz7g@mail.gmail.com>
	<20250204071834.78e0ffb1@kernel.org>
	<20250204154938.GF22963@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 4 Feb 2025 17:49:38 +0200 Laurent Pinchart wrote:
> Or apparently project or customer names for consulting companies:
>=20
>      29 Kory Maincent (Dent Project) <kory.maincent@bootlin.com>
>      34 Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@bootlin.com>

FWIW these are customer names, indeed. Project/Foundation pays for
contracting work in both cases.

> The other cases correctly refer to companeis, for contributors using
> other email addresses:
>=20
>       14 linux.dev
>       41 zytor.com
>       47 joelfernandes.org
>      176 alien8.de
>      243 gmail.com
>      333 goodmis.org
>      454 armlinux.org.uk
>      918 infradead.org
>     1007 kernel.org
>=20
> Do we want to only document existing practices, or also tell which
> one(s) should be favoured ?

I'm hoping that documenting the most prevalent existing practice
will naturally make it favored. IOW I'd prefer to document just=20
one option. I don't really care which one we pick, but the brackets
seem most common.
