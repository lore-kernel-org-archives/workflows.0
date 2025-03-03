Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24382218AB0
	for <workflows@vger.kernel.org>; Mon,  3 Mar 2025 18:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741027386; cv=none; b=YoOfAW8kZuGXayS8RiVx5jUId6Bj0g3e8iBMuKf07SJJUAbLRlOHJZ7xcxZTJ4oB3JozHZvHt0mH5didRYsO0IHYJhuuJjaSOUKeYy672/fvaICUQpZuUlu4mIPwMtencfNKqRg8sMgySEqxT8PvLUGLcF/Op59eR4Q71aBE428=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741027386; c=relaxed/simple;
	bh=bu6Dyz3S7upmMcoUYWmWGTJ71H+RGrGxVlWV2LVS3zY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=ZyKDH+EYTA+uau8wjVrtBTA4Kr1rbUixP9jT4jqX/Fiy/n4VCoMQuZRGLs3qbcAWEHHEkkXqzi/d2qI1d687guh0DFfFLI/FWAMQooaMJ9wCJ8JJSOuVxQ48iXs4eXnAZXfugVVyTIhIVut9k7CaH1WAuShuiiG1yvDeFkQAu/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uXFj/Axi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uXFj/Axi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AF7C4CED6;
	Mon,  3 Mar 2025 18:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741027385;
	bh=bu6Dyz3S7upmMcoUYWmWGTJ71H+RGrGxVlWV2LVS3zY=;
	h=Date:From:To:Cc:Subject:From;
	b=uXFj/Aximn5YfcLgq7sTuVdPx0W1eIQAWnN+KpXNnM664OyPxMflpWrhb3l3OD1c4
	 U4cgAJRvQAN0S7YuOR82xM2LoM7xikV5hI1HDNIDCJil9Jei4Fbc3p7ek6RJ9a/img
	 x/JHhGSkhtTATMvcqy7Xu+G5DjWNWMuLJhUqUNOFStvWcrptNaGbgCHzbZGjTT8VfX
	 uyuBPO57bxeyIO9PbdlbhjcHzKY7nyt8IGElByD55to1HwQ9aZsLLazdrmQ+xDjVry
	 VsSNT1MbWCnrgp0pINhvE9tVk/DNq3Mm4OOTXM8/7ZnGBo/rt64oIlvo/OIsZvkB9i
	 qyPvKMi9gZmkw==
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id 41E6D1200068;
	Mon,  3 Mar 2025 13:43:04 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-07.internal (MEProxy); Mon, 03 Mar 2025 13:43:04 -0500
X-ME-Sender: <xms:OPjFZ36fADJ4gPuC7GuRJyyy-ATR42B7Q4iV8tXNPxg9bd9_NwoK8g>
    <xme:OPjFZ844rW3QBMOg-OAIT2vwWr3QsLZXKYQGQk175TstLqJRrifIXffOBq3wL8fPe
    N2xFI6Z9vnFbhhV4wQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelleekjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkufgtgfesthhqredtredtjeen
    ucfhrhhomhepfdfnvghonhcutfhomhgrnhhovhhskhihfdcuoehlvghonheskhgvrhhnvg
    hlrdhorhhgqeenucggtffrrghtthgvrhhnpeejfeegiefffeegvdevfeehudduuefhfeeg
    vdfgkeetkeeigefhtdeikeekieekjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpd
    hlvghonhhrohdrlhhotggrlhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehlvghonhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthi
    dquddvfedtheefleekgedqvdejjeeljeejvdekqdhlvghonheppehkvghrnhgvlhdrohhr
    gheslhgvohhnrdhnuhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepkhhonhhsthgrnhhtihhnsehlihhnuhigfhhouhhnuggrthhiohhnrdho
    rhhgpdhrtghpthhtohepfihorhhkfhhlohifshesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehjghhgseiiihgvphgvrdgtrg
X-ME-Proxy: <xmx:OPjFZ-ebEk3LodxdVVh-G1gmj_6j-YlfrT9jY8HPxMt-RTe4hcJoOw>
    <xmx:OPjFZ4JX1djaCg4NyPOMxgKc05aD2hB3wBV9shgr0B_KbToZ0cHirA>
    <xmx:OPjFZ7LSkKNng7LVHkoBQ2g4tEJejOnG6m_VlLK-cQWVX2XZ1_7fUw>
    <xmx:OPjFZxw-9NqL99NYpOUKRAiVlQrZzdh1Tuq211VWD4aLHUm4CRW2wA>
    <xmx:OPjFZ3IrOaYsO9_nOVnDrwir7XBo2lRDrJBRL-WICt2OogXTse6PvMSj>
Feedback-ID: i927946fb:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 117341C20067; Mon,  3 Mar 2025 13:43:04 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 03 Mar 2025 20:40:26 +0200
From: "Leon Romanovsky" <leon@kernel.org>
To: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
Cc: workflows@vger.kernel.org, "Jason Gunthorpe" <jgg@ziepe.ca>
Message-Id: <475dccf3-f252-4ef7-bfc9-45fd58aa4fff@app.fastmail.com>
Subject: lei stores mails in wrong folder
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

I have a strange behavior for newly installed lei ("dnf install lei" on =
FC41).
All new messages are stored in "cur" Maildir folder and not in "new" as =
I would expect.
Current behavior causes to weird situation where all messages are gettin=
g "O"  (old) tag.

=E2=9E=9C  ~ lei q -I https://lore.kernel.org/all/ -o ~/mail/lore/rdma -=
-threads --dedupe=3Dmid '(l:linux-rdma.vger.kernel.org) AND rt:1.week.ag=
o..'=20
# /home/leonro/.config/lei/config created
# /home/leonro/.local/share/lei/store 15/15
# /usr/bin/curl -gSf -s -d '' https://lore.kernel.org/all/?x=3Dm&t=3D1&q=
=3D(l%3Alinux-rdma.vger.kernel.org)+AND+rt%3A1740421535..
# https://lore.kernel.org/all/ 186/?
# https://lore.kernel.org/all/ 404/?
# https://lore.kernel.org/all/ 571/571
# 488 written to /home/leonro/mail/lore/rdma/ (586 matches, 155 duplicat=
es)
=E2=9E=9C  ~ ls ~/mail/lore/rdma/new=20
=E2=9E=9C  ~ ls ~/mail/lore/rdma/cur=20
00c34ae956857960504f10d4a2d401fdc2d7b4c9:2,       450d677dfc827f61e3d0f8=
07ae9e9950a6c91f1a:2,     =20
....
=E2=9E=9C  ~ lei edit-search ~/mail/lore/rdma
    1 ; to refresh with new results, run: lei up /home/leonro/mail/lore/=
rdma
    2 ; `maxuid' and `lastresult' lines are maintained by "lei up" for o=
ptimization
    3 [lei]
    4         q =3D (l:linux-rdma.vger.kernel.org) AND rt:1.week.ago..
    5 [lei "q"]
    6         include =3D https://lore.kernel.org/all/
    7         external =3D 1
    8         local =3D 1
    9         remote =3D 1
   10         threads =3D 1
   11         dedupe =3D mid
   12         output =3D maildir:/home/leonro/mail/lore/rdma
   13 [external "/home/leonro/.local/share/lei/store"]
   14         maxuid =3D 109652
   15 [external "https://lore.kernel.org/all/"]
   16         lastresult =3D 1741026335

Thanks
