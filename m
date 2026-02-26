Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53804279DB6
	for <workflows@vger.kernel.org>; Thu, 26 Feb 2026 09:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772098392; cv=none; b=NoUMSygU41imY+CEnAEaZHm8Jvy+w8A8DzUQ34RPNs266+AswndGJTt5hygsJ2XX5ybv8OTzkgJF6n1oVNeY3+yYPOp5pzf4ZcUWP1UFe85VzaP8mMcxuMYQFHY3fUeHvrNBigOH3yXw3U71GNUzifQitfDXCF5OeA735YDc8pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772098392; c=relaxed/simple;
	bh=gKdDRJ4k87LaAx3+R8LuhxvDrJ8opW/pPfIrEoH1PWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pXywEcbEVNW15ZvNZo4yaBuQCtJ//qdldVot1z4m3ld0GiYpupEW8j40MKcrLI+a89nfMFlQfbxaXlXXnBef/9xXZloc4fIdDgxwC0GD3U5vu7w38zpVCF7LfotmcK92cIOOFdAGKDgL9i9PJjfJ6M3FEtR9s+xrTp83U+Ahsb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-126ea4e9694so1066932c88.1
        for <workflows@vger.kernel.org>; Thu, 26 Feb 2026 01:33:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772098390; x=1772703190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wN7QFDReg+d0oErhjLdM9CGSLPE5PA9L2wZop8EojNM=;
        b=tcTcl0V1Xe1CaB44tfZK/g/y0nvxoOFJsxHTVS7D6lynR8nhRXQexgdNBTwC30GO/v
         OiDzKGfbCRYqRPM8Dn8hqno/rjCovBSdUQHYP19cZWYgpMHG5kFH3odgSceMciMxvCFH
         asd5RZJnlvEJqnBiBI1j3HnhGHoyRA/86VKYnxO/QetPK/dKI/8GTjq/dJFMKWb1TkPW
         rl+NO05JcbgPjHFEdSFL+mb0J0ZJzFkV2x5pB1gufmZPdJmtVAdvueAJXeUP+yBiNzg4
         mXii+KnmlOPhA9aW26+51amb66qWquVf4vr5zr8EdxKHApZ3wYO2DMgI25H9qF4W/okS
         tpVg==
X-Forwarded-Encrypted: i=1; AJvYcCWkyyd90wGP5foG4kuFmzvQvCJqCYxGKoqt6rYRIehIvvilHbMZEIsbu+BRsZL0RQVXIJrPiGuWqn4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcf+4jupJoYFkXn3M+qKHYM/TnE56/Xmbt+QMNFQ+15jvFmEih
	OhpV2BaE2DGI3uiTxIlcexzuVJAn6frY8rHiP6+b7yHdfFBI3FBSFD6Mu2hSAPdS
X-Gm-Gg: ATEYQzyd7S/NueGZWiBcSDFZsPb0dGadEgc6DVC2OXMZaZv5XCRe6jLhJkdTUP8UcRv
	CshN9M1yc7+L1XlzUKZokxWUspCYFt7E9kJ964ljwLMjD5sgz1nZUU+ej/VLoorz/l4mw2nzp0U
	XkTbJ8LmUY/gnyNawKJoJ4bY21f2991fhBoNWQWD9FdouXXKgr9O/D3xPpFLbwKvtjhiNbT7Thy
	F7xLFcyKwQSpMCR9k4ZxbewPkivsewHSt30zYvKQYvvbhCLLpodWTMZEMjCa1zmBae5QIa7U6tA
	5NxZftf8zPv0v9jTqozBICaVuvtHKr69Zf3Zb25yev3UZqRTMLg3at5xxvnk1/dLifs0VdmmABm
	LIZay9M1gxilY0wz9TpHNpPnGzu/C5SN3NSB2PT/QE8P6oweFRCWHr4hXPYYRXjgcCMwyzLIsao
	hGSUfIdGzLA4y2UMktnhDOg7YrqFAsrnNv1iE7vcJwCt0+XiUbQUF4DhmGvmBL
X-Received: by 2002:a05:6122:88d:b0:566:3954:f74e with SMTP id 71dfb90a1353d-568e47928a5mr9860401e0c.5.1772092665514;
        Wed, 25 Feb 2026 23:57:45 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a9228d776sm1614870e0c.18.2026.02.25.23.57.45
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 23:57:45 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ff09bb668cso348501137.0
        for <workflows@vger.kernel.org>; Wed, 25 Feb 2026 23:57:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWuill6Xf8WW7h/Vyp4fLamT1Ck6Zc4kmZr1Liqd28zjePtI2wmJ4FkcapwaU+ZlUw5g3q/D1yR3og=@vger.kernel.org
X-Received: by 2002:a05:6102:510e:b0:5fd:fa9b:1a2 with SMTP id
 ada2fe7eead31-5feb30d4af4mr10289856137.28.1772092222850; Wed, 25 Feb 2026
 23:50:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZ4_sBIy8rOUL59Q@devuan> <2026022531-tightness-rare-6a14@gregkh> <aZ87Z24f9HZsofGl@devuan>
In-Reply-To: <aZ87Z24f9HZsofGl@devuan>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Feb 2026 08:50:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVDPPgkWTHPb3Mfhn2cGmv7YPquakEuF6z7zam7gGVW_g@mail.gmail.com>
X-Gm-Features: AaiRm51mZ3TMr9-1T3RZtvPkGB-I32VB6CDd1n0kyHAM014BC7DctANFpncyC8Y
Message-ID: <CAMuHMdVDPPgkWTHPb3Mfhn2cGmv7YPquakEuF6z7zam7gGVW_g@mail.gmail.com>
Subject: Re: [PATCH] Add short author date to Fixes tag
To: Alejandro Colomar <alx@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>, 
	Jacob Keller <jacob.e.keller@intel.com>, Yeking@red54.com, kuba@kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, "Theodore Ts'o" <tytso@mit.edu>, Andy Whitcroft <apw@canonical.com>, 
	Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tech-board-discuss@lists.linux.dev, 
	Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"

Hi Alejandro,

On Wed, 25 Feb 2026 at 19:20, Alejandro Colomar <alx@kernel.org> wrote:
> The case where it would matter is if you commit a fix for a commit that
> is only in your stable branch.  However, since the stable branches are
> not real branches, but actually a set of patches, I expect you would
> just drop the faulty patch, right?

Stable branches are real branches, cfr.
https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/refs/heads.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
