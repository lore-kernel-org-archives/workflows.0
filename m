Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEDC13C3F2;
	Fri, 21 Nov 2025 18:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763749757; cv=none; b=cNXX3GoHAhzpADog874hbJ7UAKwNvFV2jZnuqCpq+ZbyIGIfswz2hDxNVMKk4fQzZV09H0CPdhf0qKsAN3/LGya3y6AiF3yiUL0nTdC62sGyAqYPROUBMsA1rFGdI594RYKErpDMZTigffkvpgkbo3MLYs9nxgmJ4ExDOjTCnsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763749757; c=relaxed/simple;
	bh=g8wkgLJdS3Cxn4Y/Wb0GziOv2f12ehUTxUi8Ye4ZJwM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uVVROZCzbHwJrRLqnTiT2flXhW0AD5BVVoe1cZPk0CGDSvf3bxM1sObq8RuPidQ5W8tMIdAo9jJTJKZflsiq47z0z/2QhDOzeNdf4G9pwTB101u896V1R+nRBM8p1ymtAOp2QcdXy5isfV0BYNgQ16VpFCxxCGlvLmrz/qjFMpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 318371606DC;
	Fri, 21 Nov 2025 18:29:13 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf16.hostedemail.com (Postfix) with ESMTPA id 5538E2000F;
	Fri, 21 Nov 2025 18:29:10 +0000 (UTC)
Message-ID: <c95d1fbc737442063a95e91f741464bc37795cb8.camel@perches.com>
Subject: Re: [PATCH v5] README: restructure with role-based documentation
 and guidelines
From: Joe Perches <joe@perches.com>
To: Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
 linux-doc@vger.kernel.org
Cc: josh@joshtriplett.org, kees@kernel.org, konstantin@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 workflows@vger.kernel.org, 	rdunlap@infradead.org, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Date: Fri, 21 Nov 2025 10:29:09 -0800
In-Reply-To: <20251121180009.2634393-1-sashal@kernel.org>
References: <20251121180009.2634393-1-sashal@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: fnw3r46rx1thg3xku4gpkki7y3gef7kj
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 5538E2000F
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/3+vO7cgGNyF/mg93zW8zjcLx5gdnvZDw=
X-HE-Tag: 1763749750-636008
X-HE-Meta: U2FsdGVkX1/1exYSmNChizg9jxaQzIuFo+TMeVlQ/YtUpQtb+4VSXFyDKxWQ2CqW49sqf38vURgzzs3e8aZEn2Mg3GQTZpaMjgg+gFSB1D6wWuiKIkIpE320Hw8Hi/larC+92m95HRXdV6PP2Zvn73IQ+CWG92qef6NSPR+cHK0l9l1p/bviq7WGCUUVMZZBzsBMeBsjA65f7J+oMOKtMFGIHmXkC8ZHtx7nHto0QTTrIdhlALsScuf7CP+XY7RHw9dC85VMGrZPCOscWIyTX9j5CTS1CEhUdoRMCg4y0AhAtxRNJuOgnMA/9kGjSdYq6Y0iBCk56OpD+DwZtkbKkFBImiYbZaGT

On Fri, 2025-11-21 at 13:00 -0500, Sasha Levin wrote:
> Reorganize README to provide targeted documentation paths for different u=
ser
> roles including developers, researchers, security experts, and maintainer=
s.

Thank you Sasha.  Looks great.
